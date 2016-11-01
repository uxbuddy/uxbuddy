class TestMailer < ApplicationMailer

  def send_test_email(user, list, url)
    @url = url
    mail(to: list,
    subject: 'Please take our UX test!' )
  end

end
