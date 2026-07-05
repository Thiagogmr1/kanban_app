import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
    static values = { boardId: Number, listId: Number }

    connect() {
        this.sortable = Sortable.create(this.element, {
            group: "cards",
            animation: 150,
            onEnd: this.onEnd.bind(this)
        })
    }

    disconnect() {
        this.sortable.destroy()
    }

    onEnd(event) {
        const cardId = event.item.dataset.cardId
        const newListId = event.to.dataset.sortableListIdValue
        const boardId = event.to.dataset.sortableBoardIdValue
        const position = event.newIndex

        fetch(`/boards/${boardId}/lists/${newListId}/cards/${cardId}/move`, {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
            },
            body: JSON.stringify({ card: { list_id: newListId, position: position } })
        })
    }
}