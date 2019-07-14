class ContactJob < ApplicationJob
  queue_as :default

  def perform(contact)
    ContactMailer.send_user_contact(contact).deliver_now
  end
end
