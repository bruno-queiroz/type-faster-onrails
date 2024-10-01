class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  respond_to :html, :json

  def google_oauth2
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
        else
          session["devise.google_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
          render :sign_in_error, status: :unprocessable_entity
        end
  end
    
  def failure
      redirect_to root_path
  end
end