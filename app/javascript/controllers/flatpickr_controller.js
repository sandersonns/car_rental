import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = [ "startsAt", "endsAt" ]
  // static targets = [ "startsAt"]
  connect() {
    console.log("Hello from flatpickr_controller.js")
    // working
    // flatpickr(".fp_date_time", {
    //   enableTime: true,
    //   dateFormat: "Y-m-d",
    // }
    // );  

    flatpickr(".fp_date_time", {
      mode: "range",
      // enableTime: true,
      minDate: "today",
      dateFormat: "Y-m-d",
      onChange: this.dateChanged.bind(this),
  });  
}
    dateChanged(selectedDates) {
      const [startsAt, endsAt] = selectedDates;
      this.element.dataset.startsAt = startsAt;
      this.element.dataset.endsAt = endsAt;
    }


}
