class Contact < MailForm::Base
  include MailForm::Delivery

  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Message from visitor at peter-bentley.com",
      :to => "peter@peter-bentley.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end