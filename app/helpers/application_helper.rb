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

end
