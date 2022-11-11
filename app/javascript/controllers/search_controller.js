import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  submit(){
    let tabType = document.getElementById("tab-type")
    if(tabType.value == "posts"){
      tabType.value = "users"
    }else if(tabType.value == "users"){
      tabType.value = "posts"
    }
    this.element.requestSubmit()
  }
}
