class UserMailer < ApplicationMailer
	default from: 'fourmeteam@gmail.com' 
	
	def welcome_email(user)
		@user = user
		@url = "http://localhost:3000"
		mail(to: @user.email, subject: 'Welcome to 4ME!')
	end
end
