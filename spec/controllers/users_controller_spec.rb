require 'rails_helper'

describe UsersController do
  shared_examples_for 'http_succses' do |template|
    specify { expect(response).to have_http_status(:ok) }
    specify { expect(response).to render_template template }
  end

  describe 'login user' do
    describe 'GET #index' do
      before { get :index }

      # 1. ログインできなかった際にログインページにリダイレクトされるか (0%)
      context '???' do
      end

      # 2. ログインできた時にindexページに遷移するか (100%)
      context 'by login user' do
        it_behaves_like 'http_succses', :index
      end

      # 3. ログインしていない状態で他のページに遷移しようとしたらログインページにリダイレクト (0%)
      context '???' do
      end
    end
  end



end
