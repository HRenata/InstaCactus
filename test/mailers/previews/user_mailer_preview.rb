# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/registration_confrmation
  def registration_confrmation
    UserMailer.registration_confrmation
  end

end
