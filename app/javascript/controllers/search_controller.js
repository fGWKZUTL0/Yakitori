import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["tabType"]

  changePosts(){
    this.tabTypeTarget.value = "posts"
  }
  changeUsers(){
    this.tabTypeTarget.value = "users"
  }
  
  submit(){
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 200)
  }
}
