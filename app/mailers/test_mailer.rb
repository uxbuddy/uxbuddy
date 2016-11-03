class TestMailer < ApplicationMailer
  default :from => 'hello@uxbuddy.com'

  def send_test_email(user, list, url)
    @url = url
    mail(to: list,
    from: user.email,
    subject: 'Please take my UX feedback survey' )
  end

end
