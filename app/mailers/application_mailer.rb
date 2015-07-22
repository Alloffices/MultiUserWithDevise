class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@nobbble.com"
  layout 'mailer'
end
