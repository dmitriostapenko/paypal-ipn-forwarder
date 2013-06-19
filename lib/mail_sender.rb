require 'pony'
require_relative 'mail_creator'
class MailSender

  def send(mail)
    create(mail)
    send_email
  end

  def create(mail, gateway=nil)
    @email_creator = gateway || MailCreator.new
    @email_content = @email_creator.create(mail)
    @email_content
  end

  def send_email
    Pony.mail(@email_content)
  end

end
