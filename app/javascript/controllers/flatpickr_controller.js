import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = [ "startsAt", "endsAt" ]
  connect() {
    // console.log("Hello from flatpickr_controller.js")
    // flatpickr(this.element, {
    //   altInput: true,
    //   altFormat: "F j, Y",
    //   dateFormat: "Y-m-d",
    // })
    // flatpickr(this.startsAtTarget, {})
    // flatpickr(this.endsAtTarget, {})

    flatpickr(".fp_date_time", {
      enableTime: true,
      dateFormat: "Y-m-d",
    }
    );  

    flatpickr(".fp_date");  

  }

}
