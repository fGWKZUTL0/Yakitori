import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tabType"]

  changePosts(){
    this.tabTypeTarget.value = "posts"
  }
  changeReplies(){
    this.tabTypeTarget.value = "replies"
  }
  changeLikes(){
    this.tabTypeTarget.value = "likes"
  }

  submit(){
    this.element.requestSubmit()
  }
}
