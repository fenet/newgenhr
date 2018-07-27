class ContactsController < ApplicationController
  before_action :authenticate_admin!, except: [:show ]
  before_action :find_contact, only: [:edit, :update, :delete ]
 def index
     @contacts = Contact.order('created_at DESC')
  end 

  def show_com
  @cvs = Cv.order("created_at DESC").limit(4)
  end
  
  def edit
  end

  def new
        @contact = Contact.new
  end

  def delete
  end
 
  def create
      @contact = Contact.new(contact_params)
      if @contact.save
        flash[:notice] = "contact posted. Thanks!"
        redirect_to contacts_path
      else
        render :new
     end
  end

  def update
       if @contact.update_attributes(contact_params)
      flash[:notice] = "Successfully contact Updated!!"
      redirect_to contacts_path
     else
      render :edit 
   end
  end

  def destroy
    contact = Contact.find(params[:id]).destroy
    flash[:notice] = "Contact Deleted!!"
    redirect_to contacts_path
  end
  
  def contact_params
    params.require(:contact).permit(:testimony,:testimony_photo)
  end

  def find_contact
      @contact = Contact.find(params[:id])
  end


end
