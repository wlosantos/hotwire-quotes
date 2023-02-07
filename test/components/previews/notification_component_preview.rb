# frozen_string_literal: true

class NotificationComponentPreview < ViewComponent::Preview
  def default
    render(NotificationComponent.new(
             type: 'notice',
             data: { title: 'Success', message: 'This is a success message.' }
           ))
  end
end
