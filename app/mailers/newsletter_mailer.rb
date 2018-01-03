class NewsletterMailer < ApplicationMailer
	# default from: 'eshopper.demo.test@gmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.subscribed_user.subject
  #
  def subscribed_user(email)
    @email = email
    @url  = 'http://example.com/login'
    mail(to: @email, subject: 'Subscribed to Eshopper Newslettr')
  end

  def newsletter_email(content, email)
    @content = content
    @subscribed_email= email
    mail(to: @subscribed_email.email, subject: 'Your weekly Newsletter from Eshopper')
  end
end
