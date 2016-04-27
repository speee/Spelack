require 'rails_helper'

RSpec.describe User do
  subject { build(:user) }
  describe 'validations' do
    describe 'nickname' do
      context 'when it is empty' do
        it { is_expected.to be_invalid_on(:nickname).with(nil) }
      end

      context 'when it is over' do
        it { is_expected.to be_invalid_on(:nickname).with('a' * 21) }
      end
    end

    describe 'first_name' do
      context 'when it is empty' do
        it { is_expected.to be_invalid_on(:first_name).with(nil) }
      end

      context 'when it is over' do
        it { is_expected.to be_invalid_on(:first_name).with('a' * 31) }
      end
    end

    describe 'middle_name' do
      context 'when it is over' do
        it { is_expected.to be_invalid_on(:middle_name).with('a' * 31) }
      end
    end

    describe 'last_name' do
      context 'when it is empty' do
        it { is_expected.to be_invalid_on(:last_name).with(nil) }
      end

      context 'when it is over' do
        it { is_expected.to be_invalid_on(:last_name).with('a' * 31) }
      end
    end
  end
end
