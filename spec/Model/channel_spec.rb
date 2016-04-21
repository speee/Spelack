require 'rails_helper'

RSpec.describe Channel do
  let(:channel) { FG.build(:channel) }
  describe 'name' do
    context 'when it is empty' do
      before { channel.name = nil }
      it { is_expected.not_to be_valid }
    end

    context 'when it is over' do
      before { channel.name = 'a' * 51 }
      it { is_expected.not_to be_valid }
    end
  end

  describe 'is_private' do
    context 'when it is empty' do
      before { channel.is_private = nil }
      it { is_expected.not_to be_valid }
    end
  end

  describe 'description' do
    context 'when it is empty' do
      before { channel.description = nil }
      it { is_expected.not_to be_valid }
    end

    context 'when it is over' do
      before { channel.description = 'a' * 1001 }
      it { is_expected.not_to be_valid }
    end
  end

  describe 'created_user_id' do
    context 'when it is empty' do
      before { channel.created_user_id = nil }
      it { is_expected.not_to be_valid }
    end
  end
end
