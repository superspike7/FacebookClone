module ApplicationHelper
  def avatar_img(user, size='128', pos='north')
    if user.avatar.attached?
    user.avatar.variant(resize_to_fill: [size, size, gravity: pos])
    else
     return "https://bulma.io/images/placeholders/256x256.png"
    end
  end
end
