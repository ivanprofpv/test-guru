module SessionsHelper

  def flash_message
    flash.map do |key_class, msg|
      if msg.present?
        content_tag :div, msg, class: "flash #{key_class}"
      end
    end.join
  end

end