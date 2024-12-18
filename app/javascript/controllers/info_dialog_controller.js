// app/javascript/controllers/element_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  open() {
    console.log("Opening dialog")
    const dialog = document.getElementById('info-dialog')

    document.getElementById('info-dialog-title').innerHTML = this.element.dataset.title
    document.getElementById('info-dialog-body').innerHTML = this.element.dataset.body

    dialog.showModal()
  }
}