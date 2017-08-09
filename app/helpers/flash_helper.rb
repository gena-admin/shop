module FlashHelper
  ALERT_TYPES = %w[error info success warning notice].freeze

  def flash_messages
    flash_messages = []
    flash.each do |type, message|
      next if message.blank?

      next unless ALERT_TYPES.include?(type)

      type = 'info'   if type == 'notice'
      type = 'danger' if type == 'error'

      Array(message).each_with_index do |msg, i|
        text = content_tag(:div,
                           content_tag(:button, raw('&times;'), class: 'close', 'data-dismiss' => 'alert') +
                               msg.html_safe, class: "alert fade in alert-#{type}"),
            content_tag(:div, '<script type="text/javascript"> setTimeout(function () { $(".script").parent().find(".close").first().click()}, 5000) </script>'.html_safe, class: 'script')
        flash_messages << text if message
      end
    end

    flash_messages.join("\n").html_safe
  end
end