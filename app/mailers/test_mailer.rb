class TestMailer < ApplicationMailer
  default from: 'user@uxbuddy.com'

  def send_test_email(list)
    mail( to: list,
    from: current_user.email,
    subject: 'Please take our UX test!' )
  end

end
