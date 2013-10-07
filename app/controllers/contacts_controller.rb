class ContactsController < ApplicationController
  layout 'special'
  def new
    Rails.logger.debug "iiiiiiiiiiii"
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(secure_params)

    if @contact.valid?
      @contact.update_spreadsheet
      flash[:notice] = "Received request from #{params[:contact][:name]}"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private 
  def secure_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
