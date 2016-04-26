require 'rails_helper'

RSpec.describe ChannelsController do
  shared_examples_for 'http_succses' do |template|
    specify { expect(response).to have_http_status(:ok) }
    specify { expect(response).to render_template template }
  end
  describe 'POST #create' do
    context 'when saving channel is success' do
      before { post :create, channel: attributes_for(:channel) }
      it { change(Channel, :count).by(2) }
      specify { expect(response).to have_http_status(302) }
      specify { expect(response).to redirect_to channel_path(assigns(:channel).id) }
    end
    context 'when saving channel is not success' do
      before { post :create, channel: attributes_for(:channel, name: nil) }
      it_behaves_like 'http_succses', :new
    end
  end
  describe 'GET #index' do
    let(:channel) { create(:channel) }
    context 'when there is a search word' do
      before { get :index, search: channel.name }
      specify { expect(assigns(:channels)).to include channel }
      it_behaves_like 'http_succses', :index
    end

    context 'when the search word does not exist' do
      before { get :index }
      it_behaves_like 'http_succses', :index
    end
  end
  describe 'GET #new' do
    before { get :new }
    it_behaves_like 'http_succses', :new
  end
  describe 'GET #show' do
    let(:channel) { create(:channel) }
    before { get :show, id: channel }
    specify { expect(assigns(:channel)).to eq channel }
    it_behaves_like 'http_succses', :show
  end
  describe 'GET #edit' do
    let(:channel) { create(:channel) }
    before { get :edit, id: channel }
    specify { expect(assigns(:channel)).to eq(channel) }
    it_behaves_like 'http_succses', :edit
  end
  describe 'PATCH #update' do
    let(:channel) { create(:channel) }
    let(:name) { FFaker::BaconIpsum.characters(10) }
    context 'when updating channel is success' do
      before { patch :update, id: channel, channel: attributes_for(:channel) }
      it 'locates the requersted channel' do
        expect(assigns(:channel)).to eq channel
        expect(response).to have_http_status(302)
        expect(response).to redirect_to channel_path(assigns(:channel).id)
      end

      it 'changes channels attributes' do
        expect do
          patch :update, id: channel, channel: attributes_for(:channel, name: name)
        end.to change { assigns(:channel).name }.from(channel.name).to(name)
      end
    end
    context 'when updating channel is not success' do
      before { patch :update, id: channel, channel: attributes_for(:channel, name: nil) }
      it_behaves_like 'http_succses', :edit
    end
  end
  describe 'DELETE #destroy' do
    let(:channel) { create(:channel) }
    before { delete :destroy, id: channel }
    it 'deletes the channel' do
      channel.reload
      expect(channel.delete_at).not_to be_nil
    end
  end
end
