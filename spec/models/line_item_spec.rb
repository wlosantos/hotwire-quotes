require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe 'database' do
    context 'must be present' do
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:description).of_type(:text) }
      it { is_expected.to have_db_column(:quantity).of_type(:integer) }
      it { is_expected.to have_db_column(:unit_price).of_type(:decimal) }
    end

    context 'must be indexed' do
      it { is_expected.to have_db_index(:line_item_date_id) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:line_item_date) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_numericality_of(:quantity).only_integer.is_greater_than(0) }
    it { is_expected.to validate_presence_of(:unit_price) }
    it { is_expected.to validate_numericality_of(:unit_price).is_greater_than(0) }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:quote).to(:line_item_date) }
  end

  describe 'create a new line item' do
    context 'successfully' do
      let(:line_item) { build(:line_item) }

      it 'creates a new line item' do
        expect(line_item).to be_valid
      end
    end

    context 'failure' do
      let(:line_item) { build(:line_item, name: nil) }

      it 'does not create a new line item' do
        expect(line_item).to be_invalid
      end
    end
  end
end
