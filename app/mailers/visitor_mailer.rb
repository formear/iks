class VisitorMailer < ActionMailer::Base
  default from: "seventanyb@gmail"

  def welcome(email)
    @email = email
    mail(to: @email, subject: "welcome signup foobar kabigan")
  end
end
