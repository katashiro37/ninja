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
end
