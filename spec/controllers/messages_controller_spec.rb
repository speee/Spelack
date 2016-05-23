require 'rails_helper'

RSpec.describe SearchChannelsController do
  login_user
  shared_examples_for 'http_succses' do |template|
    specify { expect(response).to have_http_status(:ok) }
  end
  describe 'POST #create' do
    context 'when saving message is success' do
      before { post :create, message: attributes_for(:message) }
      it { change(Channel, :count).by(2) }
      it { change(assigns(:channel).users, :count).by(2) }
      specify { expect(response).to have_http_status(302) }
      specify { expect(response).to redirect_to channel_path(assigns(:channel)) }
    end
    context 'when saving channel is not success' do
      before { post :create, channel: attributes_for(:channel, name: nil) }
      it_behaves_like 'http_succses', :new
    end
  end
end
