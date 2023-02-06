require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'database columns' do
    context 'must be present' do
      it { is_expected.to have_db_column(:name).of_type(:string) }
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'create a new company' do
    context 'successfully' do
      let(:company) { build(:company) }

      it 'creates a new company' do
        expect(company).to be_valid
      end
    end

    context 'unsuccessfully' do
      let(:company) { build(:company, name: nil) }

      it 'does not create a new company' do
        expect(company).to_not be_valid
      end
    end
  end
end
