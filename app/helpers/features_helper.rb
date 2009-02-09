module FeaturesHelper

  def plus_link_to url, options= {}
    link_to image_tag('feature/plus_12x12.png'), url, options
  end

  def minus_link_to url, options= {}
    link_to image_tag('feature/minus_12x12.png'), url, options
  end
end
