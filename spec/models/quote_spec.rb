require 'rails_helper'

RSpec.describe Quote, type: :model do
  describe 'database columns' do
    context 'must be present' do
      it { is_expected.to have_db_column(:name).of_type(:string) }
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:line_item_dates).dependent(:destroy) }
  end

  describe 'create a quote' do
    context 'successfully' do
      let(:quote) { build(:quote) }
      it { expect(quote).to be_valid }
    end

    context 'failure' do
      let(:quote) { build(:quote, name: nil) }
      it { expect(quote).to_not be_valid }

      it 'quote whitout company' do
        quote = build(:quote, company: nil)
        expect(quote).to_not be_valid
        expect(quote.errors[:company]).to include('must exist')
      end
    end
  end

  describe 'methods' do
    context '#total_price' do
      let!(:quote) { create(:quote) }
      let!(:line_item_date) { create(:line_item_date, quote:) }
      let!(:line_item) { create_list(:line_item, 5, line_item_date:) }

      it 'quote total price' do
        expect(quote.total_price).to eq(Quote.find(quote.id).total_price)
      end
    end
  end
end
