class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def twitter
		@user = User.find_or_create_for_twitter_oauth(request.env['omniauth.auth'])
		if @user.persisted?
			sign_in_and_redirect @user, :event => :authentification
			flash[:notice] = "Signed in successfully"
		else
			session['devise.user_attributes'] = @user.attributes
			redirect_to new_user_registration_url
			
		end
		
	end


    def facebook
	    @user = User.find_or_create_for_facebook_oauth(request.env['omniauth.auth'])
	    if @user.persisted?
	      sign_in_and_redirect @user, :event => :authentication
	      flash[:notice] = "Signed in successfully"
	    else
	      session['devise.user_attributes'] = @user.attributes
	      redirect_to new_user_registration_url
	    end
  end

end