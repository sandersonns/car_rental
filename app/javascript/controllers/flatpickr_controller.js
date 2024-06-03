import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startsAt", "endsAt" ]

  connect() {
    console.log("Hello, Stimulus! from flatpickr_controller.js")
    console.log(this.startsAtTarget);
    flatpickr(this.startsAtTarget, {})
    console.log(this.endsAtTarget);
    flatpickr(this.endsAtTarget, {})
  }
}
