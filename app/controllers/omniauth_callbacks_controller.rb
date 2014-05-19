class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    
    # if user.email.nil?
    #   user.email = "#{request.env["omniauth.auth"].info.nickname}@twitter.com"
    # end
    if user.persisted?
      session["devise.user_attributes"]= user.attributes
      sign_in_and_redirect user,notice: "Signed in !"
    else
      session["devise.user_attributes"]= user.attributes
      # binding.pry
      redirect_to new_user_registration_url
      flash[:notice] = "Please enter your Email to continue Twitter Registration"
    end

  end
  alias_method :facebook , :all

end
