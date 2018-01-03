class NewsletterContent < ApplicationRecord
  after_create :newsletter_send

  def newsletter_send
    @newsletter_emails = Newsletter.all()
    @newsletter_emails.each do |subscribed_email|
      NewsletterMailer.newsletter_email(self, subscribed_email).deliver_now
    end
  end
end
