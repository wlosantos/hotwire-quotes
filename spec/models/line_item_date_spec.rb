require 'rails_helper'

RSpec.describe LineItemDate, type: :model do
  describe 'database' do
    context 'must have columns' do
      it { is_expected.to have_db_column(:date).of_type(:date) }
      it { is_expected.to have_db_column(:quote_id).of_type(:integer) }
    end

    context 'indexes' do
      it { is_expected.to have_db_index(:quote_id) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:quote) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:date) }
  end

  describe 'create a line item date' do
    context 'successfully' do
      let(:line_item_date) { create(:line_item_date) }

      it { expect(line_item_date).to be_valid }
    end

    context 'failure' do
      let(:line_item_date) { build(:line_item_date, date: nil) }

      it { expect(line_item_date).to_not be_valid }
    end
  end

  describe 'scopes' do
    describe '.ordered' do
      let!(:line1) { create(:line_item_date, date: Time.zone.today) }
      let!(:line2) { create(:line_item_date, date: Time.zone.today + 1.day) }

      it 'returns line item dates ordered by date' do
        expect(LineItemDate.ordered).to eq([line1, line2])
      end
    end
  end
end
