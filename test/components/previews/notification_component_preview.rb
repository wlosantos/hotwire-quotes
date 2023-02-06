# frozen_string_literal: true

class NotificationComponentPreview < ViewComponent::Preview
  def default
    render(NotificationComponent.new(type: 'type', data: 'data'))
  end
end
