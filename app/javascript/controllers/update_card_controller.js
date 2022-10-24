import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-card"
export default class extends Controller {
  connect() {
  }

  update() {

    if (this.element.classList.contains('btn-secondary')) {
      this.element.innerText = "Selected!"
      this.element.classList.remove('btn-secondary')
      this.element.classList.add('btn-primary')
    } else {
      this.element.innerText = "Bookmark this title"
      this.element.classList.remove('btn-primary')
      this.element.classList.add('btn-secondary')
    }
  }
}
