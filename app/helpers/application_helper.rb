module ApplicationHelper
  def render_turbo_frame_flash_messages
    turbo_stream.prepend 'flash', partial: 'layouts/notification'
  end

  def form_error_notification(object)
    return unless object.errors.any?

    tag.div class: 'text-sm bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4' do
      object.errors.full_messages.to_sentence.capitalize
    end
  end
end
