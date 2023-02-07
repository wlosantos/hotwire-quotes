# frozen_string_literal: true

class NotificationComponent < ViewComponent::Base
  def initialize(type: nil, data: nil)
    @type = type
    @data = prepare_data(data)
  end

  private

  def prepare_data(data)
    data.is_a?(Hash) ? data : { title: data }
  end

  def icon_notice
    case @type.to_sym
    when :notice
      content_tag(:i, nil, class: 'uil uil-check-circle text-xl text-sky-500')
    when :alert
      content_tag(:i, nil, class: 'uil uil-exclamation-triangle text-xl text-yellow-500')
    when :error
      content_tag(:i, nil, class: 'uil uil-exclamation-circle text-xl text-red-500')
    else
      content_tag(:i, nil, class: 'uil uil-info-circle text-xl text-blue-500')
    end
  end
end
