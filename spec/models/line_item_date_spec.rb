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

  describe 'methods' do
    describe '#previous_date' do
      context 'when previous date exists' do
        let!(:quote) { create(:quote) }
        let!(:line_item_date) { create(:line_item_date, date: Time.zone.today, quote:) }
        let!(:line_item_date2) { create(:line_item_date, date: Time.zone.today + 1.day, quote:) }

        it 'returns the previous line item date' do
          expect(line_item_date2.previous_date).to eq(line_item_date)
        end
      end

      context 'when previous date does not exist' do
        let!(:quote) { create(:quote) }
        let!(:line_item_date) { create(:line_item_date, date: Time.zone.today, quote:) }

        it 'returns nil' do
          expect(line_item_date.previous_date).to be_nil
        end
      end
    end
  end
end
