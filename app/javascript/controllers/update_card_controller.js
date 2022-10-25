import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-card"
export default class extends Controller {
  connect() {
  }

  update() {
    // Query Selectors
    const BUTTONS = document.querySelectorAll('.card button')
    const HIDDEN_FORM = document.getElementById('movie_id')

    if (this.element.classList.contains('btn-secondary')) {
      // Turns the selected button blue
      select(this.element)
      // Sets the value of the hidden field tag to the movie's id
      HIDDEN_FORM.value = this.element.dataset.movie
      console.log(HIDDEN_FORM.value)
      // Disables all the buttons that are not selected
      BUTTONS.forEach((button) => {
        if (button.dataset.selected == 'false') {
          deactivate(button)
        }
      })
    } else {
    // Re-enables all the buttons that were not selected
      BUTTONS.forEach((button) => {
        if (button.dataset.selected == 'false') {
          reactivate(button)
        }
      })
      // Turns the deselected button gray again
      deselect(this.element)
      // Sets the value of the hidden field tag back to zero
      HIDDEN_FORM.value = 0
      console.log(HIDDEN_FORM.value)
    }

    //  FUNCTIONS

    function select(element) {
      element.innerText = "Selected!"
      element.classList.remove('btn-secondary')
      element.classList.add('btn-primary')
      element.dataset.selected = 'true'
    }

    function deselect(element) {
      element.innerText = "Bookmark this title"
      element.classList.remove('btn-primary')
      element.classList.add('btn-secondary')
      element.dataset.selected = 'false'
    }

    function deactivate(element) {
      element.setAttribute('disabled', '')
    }

    function reactivate(element) {
      element.removeAttribute('disabled')
    }
  }
}
