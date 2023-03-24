# frozen_string_literal: true

module FlashHelper
  def flash_messages
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'danger' if %w[alert error].include?(type)
      text = "<div class=\"alert alert-#{type}\">#{message}</div>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end
end
