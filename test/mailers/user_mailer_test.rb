require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "newbooking" do
    mail = UserMailer.newbooking
    assert_equal "Newbooking", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
