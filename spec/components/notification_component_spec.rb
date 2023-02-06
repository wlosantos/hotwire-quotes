# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NotificationComponent, type: :component do
  let(:rendered) { render_inline(component) }

  context 'create flash notice' do
    context 'successfully' do
      let(:component) do
        described_class.new(type: 'notice', data: { title: 'Success', message: 'Quote was successfull created.' })
      end

      it 'renders the title' do
        expect(rendered.css('.notification__title').text).to eq('Success')
      end

      it 'renders the message' do
        expect(rendered.css('.notification__message').text).to eq('Quote was successfull created.')
      end
    end
  end
end
