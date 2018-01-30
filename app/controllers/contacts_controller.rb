class ContactsController < ApplicationController
  # protect_from_forgery with: :exception
  before_action :authenticate_user! # this will protect the page when not signed in
  before_action :find_contact, only: [:show, :edit,:update,:destroy, :delete]
  before_action :all_contacts, only: [:index, :show]


    def index
      session[:selected_group_id] = params[:group_id]
#      @contacts = Contact.by_group(params[:group_id]).search(params[:term]).order(created_at: :desc).page(params[:page]) #with default page set on kaminari Config
      # @contacts = current_user.contacts.by_group(params[:group_id]).search(params[:term]).order(created_at: :desc).page(params[:page]) #using user_id as reference
    end

    def show
       # @contacts = Contact.find(params[:id])
    end

    def new
      @contact = Contact.new
    end

    def autocomplete
      @contacts = current_user.contacts.search(params[:term]).order(created_at: :desc).page(params[:page]) # using user_id as reference
      #@contacts = Contact.search(params[:term]).order(created_at: :desc).page(params[:page])
      # render json: @contacts.map{ |contact| { id: contact.id, value: contact.name } }
    end

    def create
        @contact = current_user.contacts.build(contact_params) # using user_id as reference
        #@contact = Contact.new(contact_params)
        # if @contact.save
        #   flash[:success] = "Contact was successfully created."
        #   redirect_to contacts_path(previous_query_string)
        # else
        #   flash[:error] = "Contact failed to be created."
        #   render :new
        # end
        respond_to do |format|
            if @contact.save
                format.html do
                    flash[:success] = "Contact was successfully created."
                    redirect_to contacts_path(previous_query_string)
                end
                # format.js { render 'create', status: :created }
            else
                format.html do
                    flash[:error] = "Contact failed to be created."
                    render 'new'
                end
                format.js { render 'new', status: :unprocessable_entity }
            end
        end
    end

    def edit
      # @contact = Contact.find(params[:id])
      #authorize @contact
    end

    def update
      authorize @contact
      # @contact = Contact.find(params[:id])
      # if @contact.update(contact_params)
      #    flash[:success] = "Contact was successfully updated."
      #    redirect_to contacts_path(previous_query_string)
      # else
      #    flash[:error] = "Contact failed to be updated."
      #    render 'edit'
      # end
      respond_to do |format|
          if @contact.update(contact_params)
              format.html do
                  flash[:success] = "Contact was successfully updated."
                  redirect_to contacts_path(previous_query_string)
              end
              # format.js { render 'update', status: :ok }
          else
              format.html do
                  flash[:error] = "Contact failed to be updated."
                  render 'edit'
              end
              format.js { render 'edit', status: :unprocessable_entity }
          end
       end
    end

    def destroy
      authorize @contact
      # @contact = Contact.find(params[:id])
    #   @contact.destroy
    #   flash[:success] = "Contact was successfully deleted."
    #   redirect_to contacts_path(previous_query_string)
      @contact.destroy
      respond_to do |format|
          format.html do
              flash[:success] = "Contact was successfully deleted."
              redirect_to contacts_path(previous_query_string)
          end
      end
    end

    private

    def contact_params
      params.require(:contact).permit(:name, :email, :company, :address, :phone, :group_id, :avatar)
    end

    def find_contact
      @contact = Contact.find(params[:id])
    end

    def all_contacts
      @contacts = current_user.contacts.by_group(params[:group_id]).search(params[:term]).order(created_at: :desc).page(params[:page])
    end

    def previous_query_string
      session[:selected_group_id] ? {group_id: session[:selected_group_id]} : {}
    end

end
