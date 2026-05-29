import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["panel"]

  select(event) {
    event.preventDefault()
    const index = parseInt(event.params.index)
    this.#showPanel(index)
    this.#updateTabs(event.currentTarget, index)
  }

  selectFromDropdown(event) {
    const index = parseInt(event.target.value)
    this.#showPanel(index)
  }

  #showPanel(index) {
    this.panelTargets.forEach((panel, i) => {
      panel.classList.toggle("hidden", i !== index)
    })
  }

  #updateTabs(activeTab, index) {
    const tabs = this.element.querySelectorAll("nav a")
    tabs.forEach((tab, i) => {
      if (i === index) {
        tab.classList.add("bg-indigo-100", "text-indigo-700")
        tab.classList.remove("text-gray-500", "hover:text-gray-700")
        tab.setAttribute("aria-current", "page")
      } else {
        tab.classList.remove("bg-indigo-100", "text-indigo-700")
        tab.classList.add("text-gray-500", "hover:text-gray-700")
        tab.removeAttribute("aria-current")
      }
    })
  }
}
