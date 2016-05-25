class RegistrationsController < Devise::RegistrationsController
    def after_inactive_sign_up_path_for(resource)
      '/users/after_sign_up'
    end

    def after_sign_up_path_for(resource)
      '/users/after_sign_up'
    end

    # # メール確認完了後の遷移先
    # def after_confirmation_path_for(resource_name, resource)
    #   '/users/after_sign_up'
    # end

    # # 認証メールを再送信した後の遷移先
    # def after_resending_confirmation_instructions_path_for(resource_name)
    #   '/users/after_sign_up'
    # end
end
