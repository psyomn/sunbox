#Author:: Simon Symeonidis
# This is the controller for handling messages from/to users
class MessagesController < ApplicationController
  before_filter :authenticate_user!
  # GET /messages
  def index
    @messages = Message.find_all_by_to_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /messages/1
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /messages/new
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  def create
    @message = Message.new(params[:message])
    user = User.find_by_name(params[:message][:to_user])

    p params 
    puts " ---- The user is : #{user.name} (#{user.id}) ---- " 

    respond_to do |format|
      
      if user.nil? 
        format.html { redirect_to action: "new" } 
      else 
        @message.to_user_id = user.id
        @message.from_user_id = current_user.id 
      end 

      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
    end
  end
end
