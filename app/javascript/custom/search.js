{
  const searchForm = document.getElementById("search-form")
  const postsTab = document.getElementById("posts-tab")
  const usersTab = document.getElementById("users-tab")
  const repliesTab = document.getElementById("replies-tab")
  let tabType = document.getElementById("tab-type")

  postsTab.addEventListener("click", function(){
    tabType.value = "posts"
  })

  usersTab.addEventListener("click", function(){
    tabType.value = "users"
  })

  repliesTab.addEventListener("click", function(){
    tabType.value = "replies"
  })
}