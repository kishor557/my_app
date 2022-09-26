import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["pin"]  

  copy() {
    const element = this.pinTarget
    const pin = element.value
    //console.log("name, ${name}!")
    console.log("name", pin)
  }

}
