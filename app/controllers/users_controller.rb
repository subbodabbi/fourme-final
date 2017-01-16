class UsersController < ApplicationController
	

	def create
    @user = user_from_params

    if @user.save
      sign_in @user
      UserMailer.welcome_email(@user).deliver_now
     	redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end

end

