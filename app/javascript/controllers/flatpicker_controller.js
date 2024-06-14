import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = [ "startsAt", "endsAt" ]

  connect() {
    flatpickr(this.startsAtTarget, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
    })
    flatpickr(this.endsAtTarget, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
    })
  }
}
