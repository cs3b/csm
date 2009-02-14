module FeaturesHelper
  PLUS_IMG = "image_tag('feature/plus_12x12.png')"
  MINUS_IMG = "image_tag('feature/minus_12x12.png')"
  def plus_link_to url, options= {}
    link_to eval(PLUS_IMG), url, options
  end

  def minus_link_to url, options= {}
    link_to eval(MINUS_IMG), url, options
  end
  
  def plus_link_to_function url, options= {}
    link_to_function eval(PLUS_IMG), url, options
  end

  def minus_link_to_function url, options= {}
    link_to_function eval(MINUS_IMG), url, options
  end


end
