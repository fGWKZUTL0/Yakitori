module ApplicationHelper
  def nl2br(str) #改行用helper
    h(str).gsub(/\R/, "<br>").html_safe
  end
end
