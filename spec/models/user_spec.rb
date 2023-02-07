require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:company) }
  end

  describe 'create a user' do
    context 'successfully' do
      let(:user) { build(:user) }
      it { expect(user).to be_valid }
    end

    context 'failure' do
      let(:user) { build(:user, email: nil) }
      it { expect(user).to_not be_valid }

      it 'user whitout company' do
        user = build(:user, company: nil)
        expect(user).to_not be_valid
        expect(user.errors[:company]).to include('must exist')
      end
    end
  end
end
