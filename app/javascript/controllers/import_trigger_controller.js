import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "form", "input", "label"]

  open() {
    this.buttonTarget.classList.add("is-loading")

    requestAnimationFrame(() => {
      setTimeout(() => this.inputTarget.click(), 0)
    })
  }

  submit() {
    if (this.inputTarget.files.length === 0) {
      this.buttonTarget.classList.remove("is-loading")
      return
    }

    this.formTarget.requestSubmit()
  }
}
