class AdminMailer < ActionMailer::Base
	default from: "no-reply@nobbble.com"
	default to: "nobbble1@gmail.com"

	def new_user(user)
		@user = user
		mail(subject: "New User #{user.email}")
	end

end
