module SessionsHelper

  def flash_message
    flash.map do |key_class, msg|
      content_tag :div, msg, class: "flash #{key_class}"
    end.join
  end

end