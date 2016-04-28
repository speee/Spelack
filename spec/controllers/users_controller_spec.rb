require 'rails_helper'

describe UsersController do
  shared_examples_for 'http_succses' do |template|
    specify { expect(response).to have_http_status(:ok) }
    specify { expect(response).to render_template template }
  end
  describe 'GET #index' do
    before { get :index }
    it_behaves_like 'http_succses', :index
  end
end
