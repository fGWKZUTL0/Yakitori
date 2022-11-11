import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  submit(){
    let tabType = document.getElementById("tab-type")
    if(tabType.value == "posts"){
      tabType.value = "replies"
    }else if(tabType.value == "replies"){
      tabType.value = "posts"
    }
    this.element.requestSubmit()
  }
}
