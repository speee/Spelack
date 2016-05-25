class RegistrationsController < Devise::RegistrationsController
    def after_inactive_sign_up_path_for(resource)
      '/users/after_sign_up'
    end

    def after_sign_up_path_for(resource)
      '/users/after_sign_up'
    end
end
