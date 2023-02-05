# frozen_string_literal: true

#
# Uncomment this and change the path if necessary to include your own
# components.
# See https://github.com/heartcombo/simple_form#custom-components to know
# more about custom components.
# Dir[Rails.root.join('lib/components/**/*.rb')].each { |f| require f }
#
# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  # Wrappers are used by the form builder to generate a
  # complete input. You can remove any component from the
  # wrapper, change the order or even add your own to the
  # stack. The options given below are used to wrap the
  # whole input.
  config.wrappers :default, class: :input, hint_class: :field_with_hint, error_class: :field_with_errors,
                            valid_class: :field_without_errors do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'label-visible'
    b.use :input, class: '', error_class: ''
  end

  # Default configuration
  config.generate_additional_classes_for = []
  config.default_wrapper = :default
  config.button_class = 'btn'
  config.label_text = ->(label, _, _) { label }
  config.error_notification_tag = :div
  config.error_notification_class = ''
  config.browser_validations = false
  config.boolean_style = :nested
  config.boolean_label_class = ''
end
