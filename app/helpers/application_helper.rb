module ApplicationHelper

  def get_image(post)
    if post.image.attached?
      image = post.image
    else
      image = "base_education.jpg"
    end
    image_tag image, class: 'adjust_image'
  end

  def get_tumbnail(streaming)
    if streaming.tumbnail.attached?
      image = streaming.tumbnail
    else
      image = "video.jpg"
    end
    image_tag image, class: 'adjust_image'
  end

  def get_avatar(user, css_class = 'photo')
    if user.avatar.attached?
      avatar = user.avatar.variant(resize: '100x100^', crop: "100x100+0+0")
    else
      avatar = "default-avatar.jpg"
    end
    image_tag avatar, class: css_class
  end

  def requested_friends(user)
    Friend.friend_requested(user.id)
  end

  def list_friends(user)
    Friend.list_friends_requested(user)
  end

  def updated_friend(id, status)
    {id: id, status: status}.to_json
  end

  def update_comment_post(commentid, published, origem)
    {id: commentid, published: published, origem: origem}.to_json
  end

end
