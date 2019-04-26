class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    contact = Contact.new contact_params

    if contact.valid?
      ContactJob.perform_later(contact_params.to_h)
      redirect_to root_path, notice: 'Your contact has sent successfully'
    else
      flash[:danger] = 'Your contact was not valid !'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(Contact::CONTACT_ATTRS)
  end
end
