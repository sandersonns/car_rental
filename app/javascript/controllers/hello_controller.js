import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name" ]

  connect() {
    console.log("Hello from hello_controller.js")
    this.element.textContent = "Hello World!"
  }

  greet() {
    const name = this.nameTarget.value
    console.log(`Hello, ${name}!`)
  }
}