require 'rails_helper'

RSpec.describe ChannelsController do
  shared_examples_for 'http_succses' do |template|
    it { expect(response.status).to eq(200) }
    it { expect(response).to render_template template }
  end
  describe 'POST #create' do
    context 'when saving channel is succeeded' do
      before { post :create, channel: attributes_for(:channel) }
      it { change(Channel, :count).by(2) }
      it { expect(response).to have_http_status(302) }
      it { expect(response).to redirect_to channel_path(assigns(:channel).id) }
    end
    context 'when saving channel is not succeeded' do
      before { post :create, channel: attributes_for(:channel, name: nil) }
      it_behaves_like 'http_succses', :new
    end
  end
  describe 'GET #index' do
    before { get :index }
    it_behaves_like 'http_succses', :index
  end
  describe 'GET #new' do
    before { get :new }
    it_behaves_like 'http_succses', :new
  end
end
