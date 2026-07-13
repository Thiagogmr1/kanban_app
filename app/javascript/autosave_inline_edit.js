document.addEventListener("turbo:load", () => {
    document.querySelectorAll(".list-title-input, .card-title-input").forEach((input) => {
        input.addEventListener("blur", () => {
            if (input.value.trim() !== "" && input.form) {
                input.form.requestSubmit()
            }
        })
    })
})