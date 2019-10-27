class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :update, :destroy]
    # POST /applications/:token/chats/:id/messages
    def create
        @message = Message.create(message_params)
        # @chats_count = Chat.where(app_id: @message.app_id).count
        # @messages_count = Message.where(chat_id: @message.chat_id).count

        @chat = Chat.where(id: @message.chat_id)
        # puts @chat[0]["messages_count"]
        @chat.update_all(:messages_count => @chat[0]["messages_count"] + 1)
        # @messages_count = Message.where(chat_id: @message.chat_id).count


        # Application.update_attribute(:chats_count,@chats_count)
        #Chat.update_attribute(:messages_count,@messages_count)
        render json: @message
    end

    #GET /applications/:token/chats/:id/messages
    def index
        # @application = Application.where(token: params[:token])
        @application = Application.where(token: params[:token])
        @chat_temp = Chat.where(app_id: @application.ids)
        @chat = @chat_temp.where(id: params[:id])
        @messages = Message.where(chat_id: @chat.ids)
        # @messages = Message.all
        render json: @messages
        # json_response(@applications)
    end

    #GET /applications/:token/chats/:id/messages/:msg_id
    def show

        render json: @message
        # json_response(@application)
    end

    #POST /applications/:token/chats/:id/messages/:query
    def retrieve
        query = params[:query]
        @application = Application.where(token: params[:token])
        @chat_temp = Chat.where(app_id: @application.ids)
        @chat = @chat_temp.where(id: params[:id])
        @messages_temp = Message.where(chat_id: @chat.ids)
        if query
            @messages_filtered = Message.where(chat_id: @chat.ids).search_elastic(query)
        end
        render json: @messages_filtered
        # json_response(@application)
    end

    def message_params
    # whitelist params
        # params[:token] = SecureRandom.urlsafe_base64(16)
        params.permit(:chat_id, :app_id,:body)
    end
    def set_message
        @application = Application.where(token: params[:token])
        @chat_temp = Chat.where(app_id: @application.ids)
        @chat = @chat_temp.where(id: params[:id])
        @messages_temp = Message.where(chat_id: @chat.ids)
        @message = Message.where(id: params[:msg_id])
        # @message = Message.find(params[:id])
    end
end
