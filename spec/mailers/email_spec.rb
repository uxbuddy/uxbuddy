require 'spec_helper'

describe TestMailer, type: :mailer do

  describe '#send_test_email' do
    let(:user) { double :user, email: 'example@user.com'}
    let(:mail) { described_class.send_test_email(user, 'recipient@example.com', 'www.test.com').deliver_now}

    it 'renders the subject' do
      expect(mail.subject).to eq('Please take my UX feedback survey')
    end

    it "renders the sender email as current user's email" do
      expect(mail.from).to eq([user.email])
    end

    it 'renders the recipient email' do
      expect(mail.to).to eq(['recipient@example.com'])
    end

    it 'renders test url as link in email' do
      url = 'www.test.com'
      expect(mail.body.encoded).to have_link("#{url}", href: url )
    end

    it 'renders test url as "Take Survey" link in email' do
      url = 'www.test.com'
      expect(mail.body.encoded).to have_link("Take Survey", href: url )
    end

  end

end
