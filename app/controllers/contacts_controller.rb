class ContactsController < ApplicationController
  before_action :find_contact, only: [:edit,:update,:destroy]
    def index
    	#@contacts = Contact.all
    	#@contacts = Contact.page.per(10) kaminari GEM
      if params[:group_id] && !params[:group_id].empty?
         #@contacts = Contact.where(group_id: params[:group_id]).page(params[:page]) #use where method for group_id param
         @contacts = Group.find(params[:group_id]).contacts.page(params[:page]).order(created_at: :desc) # another way to get group_id
      else
    	   @contacts = Contact.page(params[:page]).order(created_at: :desc) #with default page set on kaminari Config
      end
    end

    def new
      @contact = Contact.new
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

    def edit
      # @contact = Contact.find(params[:id])
    end

    def update
      # @contact = Contact.find(params[:id])
      if @contact.update(contact_params)
         flash[:success] = "Contact was successfully updated."
         redirect_to contacts_path
      else
         render 'edit'
      end
    end

    def destroy
      # @contact = Contact.find(params[:id])
      @contact.destroy
      flash[:success] = "Contact was successfully deleted."
      redirect_to contacts_path
    end

    private

    def contact_params
      params.require(:contact).permit(:name, :email, :company, :address, :phone, :group_id, :avatar)
    end

    def find_contact
      @contact = Contact.find(params[:id])
    end
end
