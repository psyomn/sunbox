#Author:: Simon Symeonidis
# This is the controller for handling messages from/to users
class MessagesController < ApplicationController
  before_filter :authenticate_user!
  # GET /messages
  def index
    @messages = Message.find_all_by_to_user_id(current_user.id)

    flash[:notice] = "No new messages." if @messages.empty?

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /messages/1
  def show
    @message = Message.find(params[:id])

    if @message.status == 0 and current_user.id == @message.to_user.id
      @message.status = 1
      @message.save
    end 

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

  # POST /messages
  def create
    user = User.find_by_name(params[:message][:to_user])

    respond_to do |format|
      if user.nil? 
        format.html { redirect_to action: "new" } 
      else 
        @message = Message.new
        @message.to_user_id = user.id
        @message.from_user_id = current_user.id 
        @message.subject = params[:message][:subject]
        @message.contents = params[:message][:contents]
        @message.status = 0
      end 

      if @message.save
        format.html { redirect_to @message, notice: 'Message was sent.' }
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
