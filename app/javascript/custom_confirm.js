function setupCustomConfirm() {
    Turbo.config.forms.confirm = (message) => {
        return new Promise((resolve) => {
            const overlay = document.getElementById("confirm-modal-overlay")
            const messageEl = document.getElementById("confirm-modal-message")
            const confirmBtn = document.getElementById("confirm-modal-confirm")
            const cancelBtn = document.getElementById("confirm-modal-cancel")

            messageEl.textContent = message
            overlay.classList.add("is-open")

            const cleanup = (result) => {
                overlay.classList.remove("is-open")
                confirmBtn.removeEventListener("click", onConfirm)
                cancelBtn.removeEventListener("click", onCancel)
                overlay.removeEventListener("click", onOverlayClick)
                resolve(result)
            }
            const onConfirm = () => cleanup(true)
            const onCancel = () => cleanup(false)
            const onOverlayClick = (e) => {
                if (e.target === overlay) cleanup(false)
            }

            confirmBtn.addEventListener("click", onConfirm)
            cancelBtn.addEventListener("click", onCancel)
            overlay.addEventListener("click", onOverlayClick)
        })
    }
}

document.addEventListener("turbo:load", setupCustomConfirm)