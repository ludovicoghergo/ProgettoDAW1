class ContactController < ApplicationController
skip_before_action :authorized
  def index
  end

  def create
    @contact = Contact.create(params.require(:contact).permit(:name,:telnumb,:email,:msg))
    @contact.save
  end
end
