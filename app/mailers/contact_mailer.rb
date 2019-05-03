class ContactMailer < ApplicationMailer

  def send_user_contact(contact)
    @item = contact
    mail(to: ENV['EMAIL_ADMIN'])
  end
end
