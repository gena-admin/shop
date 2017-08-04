module FlashHelper
  ALERT_TYPES = %w[error info success warning].freeze

  def flash_messages
    flash_messages = []
    flash.each do |type, message|
      next if message.blank?

      next unless ALERT_TYPES.include?(type)

      type = 'danger' if type == 'error'

      Array(message).each_with_index do |msg, i|
        text = content_tag(:div,
                           content_tag(:button, raw('&times;'), class: 'close', 'data-dismiss' => 'alert') +
                               msg.html_safe, class: "alert fade in alert-#{type}"),
            content_tag(:div, '<script type="text/javascript"> setTimeout(function () { $(".script").parent().find(".close").first().click()}, 50000) </script>'.html_safe, class: 'script')
        flash_messages << text if message
      end
    end
    binding.pry
    flash_messages.join("\n").html_safe
  end
end