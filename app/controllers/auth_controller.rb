class AuthController < ApplicationController

    def callback
        provider_user = request.env['omniauth.auth']
        render json: provider_user

        @user = User.find_or_create_by(auth_hash: provider_user['uid'], provider:params[:provider]) do |u|
            u.name=provider_user['info']['name']
            u.email=provider_user['info']['email']

            password = SecureRandom.base64(50)
            u.password = password
            u.password_confirmation= password
        end

        session[:user_id] = @user.id
        redirect_to login_path
    end

    def logout
        session[:user_id]=nil
        redirect_to root_path
    end

    def failure
        #TODO: render a page with a failure message
        render plain: "this is a failure"
    end

end