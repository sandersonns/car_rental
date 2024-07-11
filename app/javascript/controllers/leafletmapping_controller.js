import { Controller } from "@hotwired/stimulus"
import L from "leaflet"
// import "leaflet-control-geocoder"

export default class extends Controller {
  static targets = [ "map", "button" ]

  connect() {
    this.map = L.map(this.mapTarget).setView([51.505, -0.09], 2);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19
    }).addTo(this.map);

    this.carLocations = JSON.parse(this.mapTarget.dataset.locations);

    this.carLocations.forEach(car => {
      L.marker([car.lat, car.lon]).addTo(this.map)
        .bindPopup(car.address)
        .openPopup();
    });
  }
}
  // connect() {
  //   if (this.hasMapTarget) {
  //     this.initializeMap();
  //   } else {
  //     console.error("Map container not found.");
  //   }
  // }

  // initializeMap() {
  //   this.map = L.map(this.mapTarget).setView([0, 0], 2);

  //   L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  //     attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  //   }).addTo(this.map);

  //   this.buttonTargets.forEach(button => {
  //     button.addEventListener('click', () => {
  //       const carId = button.getAttribute('data-car-address');
  //       fetch(`/cars/${carId}/location`)
  //         .then(response => response.json())
  //         .then(data => {
  //           const latLng = [data.lat, data.lng];
  //           this.map.setView(latLng, 13);
  //           L.marker(latLng).addTo(this.map);
  //         });
  //     });
  //   });
  // }

