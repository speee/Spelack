require 'rails_helper'

describe UsersController do
  shared_examples_for 'http_succses' do |template|
    specify { expect(response).to have_http_status(:ok) }
    specify { expect(response).to render_template template }
  end

  login_user
  describe 'login user' do
    describe 'GET #index' do
      # 1. ログインできなかった際にログインページにリダイレクトされるか
      context '???1' do
        subject do
          logout(:user)
          @user = User.new(email: nil)
          sign_in @user
        end
        specify { expect(subject).to redirect_to(new_user_session_path) }
      end

      # 2. ログインできた時にindexページに遷移するか
      context 'by login user' do
        before { get :index }
        it_behaves_like 'http_succses', :index
      end

      # 3. ログインしていない状態で他のページに遷移しようとしたらログインページにリダイレクトされる
      context '???3' do
        subject do
          logout(:user)
          # before { get :index }
        end
        specify { expect(subject).to redirect_to(new_user_session_path) }
      end

      context 'should have a current_user' do
        specify { expect(subject.current_user).to_not eq(nil) }
      end

      context 'should get index' do
        before { get :index }
        specify { response.should be_success }
      end

    end
  end
end
