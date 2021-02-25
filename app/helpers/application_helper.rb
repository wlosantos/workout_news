module ApplicationHelper

  def get_image(post)

    if post.image.attached?
      image = post.image
    else
      image = "base_education.jpg"
    end
    image_tag image
  end
end
