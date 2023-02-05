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

  describe 'create a quote' do
    context 'successfully' do
      let(:quote) { build(:quote) }
      it { expect(quote).to be_valid }
    end

    context 'failure' do
      let(:quote) { build(:quote, name: nil) }
      it { expect(quote).to_not be_valid }
    end
  end
end
