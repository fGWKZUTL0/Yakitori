module PostsHelper
  def reply_count(post)
    Post.all.where(parent_id: post.id).count
  end

  def get_childs(post)
    Post.all.where(parent_id: post.id)
  end
end
