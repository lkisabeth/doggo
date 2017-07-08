module HowlsHelper
  def form_image_select(howl)
    return image_tag howl.image.url(:medium), id: 'image-preview', class: 'img-responsive' if howl.image.exists?
    image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
  end
end
