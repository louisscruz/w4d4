class UserMailer < ApplicationMailer
  default from: 'louisstephancruz@me.com'

  def activation_email(user)
    @user = user
    @url = "http://localhost:3000/users/activate?activation_code=" + user.activation_code
    mail(to: user.email, subject: "Activate")
  end
end
