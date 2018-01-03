require 'test_helper'

class NewsletterMailerTest < ActionMailer::TestCase
  test "subscribed_user" do
    mail = NewsletterMailer.subscribed_user
    assert_equal "Subscribed user", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
