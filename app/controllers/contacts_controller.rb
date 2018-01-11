class ContactsController < ApplicationController
  def index
  	#@contacts = Contact.all
  	#@contacts = Contact.page.per(10) kaminari GEM
  	@contacts = Contact.page(params[:page]) #with default page set on kaminari Config
  end
end
