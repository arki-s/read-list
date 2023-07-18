import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items"]

  connect() {
    // console.log(this.element)
    // console.log(this.itemsTarget)
  }

  send(event) {
    console.log("TODO: send request in AJAX")
    // event.preventDefault()
    // fetch(this.itemsTarget.action, {
    //   method: "POST",
    //   headers: { "Accept": "application/json" },
    //   body: new FormData(this.itemsTarget)
    // })
    //   .then(response => response.json())
    //   .then((data) => {
    //     console.log(data)
    //   })

  }
}


{/* <div class="HeartAnimation heart-position " data-controller="heart" data-action="click->heart#animate"></div>

animate(event) {
  event.currentTarget.classList.toggle("animate");
}

import HeartController from "./heart_controller"
application.register("heart", HeartController) */}
