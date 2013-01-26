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
    respond_to do |format|
      if current_user.id == @message.to_user_id or 
         current_user.id == @message.from_user_id 
        if @message.status == 0 and current_user.id == @message.to_user.id
          @message.status = 1
          @message.save
        end 
        format.html # show.html.erb
      else 
        format.html{ redirect_to action: "index" }
      end
    end
  end

  def sent
    @messages = Message.find_all_by_from_user_id(current_user.id)
  end

  # GET /messages/1/reply
  def reply
    @message_from = Message.find(params[:id])
    @reply = Message.new
    unless (@message_from.to_user_id == current_user.id or 
            @message_from.from_user_id == current_user.id)
      respond_to do |format| 
        format.html {redirect_to  action: "index" }
      end
    end 
  end
  
  # POST /messages/1/reply/create
  # TODO REMOVE ME 
  def create_reply
    flash[:notice] = "Replied to message."


    respond_to do |format| 
      format.html { redirect_to action: "index" }
    end
  end

  # GET /messages/new
  def new
    @message = Message.new
  end


  # POST /messages
  # TODO: check that the user replying, CAN reply to the message
  def create
    user = User.find_by_name(params[:message][:to_user])

    respond_to do |format|
      if user.nil? 
        flash[:alert] = "No such user."
        format.html { redirect_to action: "new" } 
      elsif !user_exists_in_thread(params[:message][:previous_message_id])
        flash[:alert] = "What are you trying to do?"
        format.html { redirect_to action: "new"}
      else 
        @message = Message.new
        @message.to_user_id = user.id
        @message.from_user_id = current_user.id 
        @message.subject = params[:message][:subject]
        @message.contents = params[:message][:contents]
        @message.previous_message_id = params[:message][:previous_message_id]
        @message.status = 0
        @message.save
        format.html { redirect_to @message, notice: 'Message was sent.' }
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

private

  # Check to see if a user actually exists in a mail thread
  def user_exists_in_thread(message_id)
    it = Message.find(message_id)

    begin
      return true if it.to_user_id == current_user.id
      it = it.previous_message
    end while !it.previous_message.nil?

    false
  rescue
    # No message found, new thread, allow reply (new message in this case)
    true
  end
end
