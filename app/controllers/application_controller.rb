class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def index 
        @user = current_user
    end
end
