import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nested-form"
export default class extends Controller {
  static targets = [ 'template', 'passengers', 'removePassenger' ]
  static values = { 
    containerSelector: { type: String },
  }

  add(event) {
    event.preventDefault()
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime().toString())
    this.passengersTarget.insertAdjacentHTML('beforeend', content)

    this.updateRemoveButtons()
  }

  remove(e) {
    e.preventDefault()
    const container = e.target.closest(this.containerSelectorValue)

    if (this.passengersTarget.childElementCount > 1) container.remove()
    
    this.updateRemoveButtons()
  }

  updateRemoveButtons() {
    const removeButtons = this.removePassengerTargets
    console.log(removeButtons)

    if (this.passengersTarget.childElementCount === 1) {
      removeButtons.forEach(btn => btn.style.display = 'none');
    } else {
      removeButtons.forEach(btn => btn.style.display = "inline-block")
    }
  }
}
