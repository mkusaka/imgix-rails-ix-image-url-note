module CommentsHelper
  def ex_ix_image_url(path, options = {}) 
    ix_image_url(image_path(path), options)
  end

  def ex_ix_image_tag(path, **options)
    ix_image_tag(image_path(path), **options)
  end
end
