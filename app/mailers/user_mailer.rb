class UserMailer < ApplicationMailer
  # default from: 'eshopper.demo.test@gmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_created.subject
  #
  def user_created(user)
    # @greeting = "Hi"
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    attachments.inline['logo.png'] = File.read('app/assets/images/home/logo.png')
    mail(to: @user.email, subject: 'Succesfully created account on Eshopper')

    # mail to: "to@example.org"
  end
end
