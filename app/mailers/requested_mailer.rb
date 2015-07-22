class RequestedMailer < ActionMailer::Base
	default from: "no-reply@nobbble.com"

	def requested_created(current_user, post_user, title)

		@current_user = current_user
		@post_user = post_user
		@title = title

		mail(to: post_user.email,
			subject: "Request From Another Creative",
			body: "this is another message from some one requestingt o join my project. #{current_user}"
			)
	end

end
