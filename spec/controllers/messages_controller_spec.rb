require 'rails_helper'

RSpec.describe MessagesController do
  login_user
  describe 'POST #create' do
    context 'when saving message is success' do
      before { post :create, message: attributes_for(:message) }
      it { change(Message, :count).by(1) }
      specify { expect(response).to have_http_status(:ok) }
    end
    context 'when saving message is not success' do
      before { post :create, message: attributes_for(:message, text: nil) }
      it 'redirects to message' do
        expect(response).to have_http_status(302)
      end
      it 'renders to #index' do
        expect(response).to render_template(:index)
      end
    end
  end
end
