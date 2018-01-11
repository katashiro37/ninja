class ContactsController < ApplicationController
    def index
    	#@contacts = Contact.all
    	#@contacts = Contact.page.per(10) kaminari GEM
      if params[:group_id] && !params[:group_id].empty?
         #@contacts = Contact.where(group_id: params[:group_id]).page(params[:page]) #use where method for group_id param
         @contacts = Group.find(params[:group_id]).contacts.page(params[:page]) # another way to get group_id
      else
    	   @contacts = Contact.page(params[:page]) #with default page set on kaminari Config
      end
    end

    def new
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
          flash[:success] = "Contact was successfully created."
          redirect_to contacts_path
        else
          render 'new'
        end
    end

    private

    def contact_params
      params.require(:contact).permit(:name, :email, :company, :address, :phone, :group_id)
    end
end
