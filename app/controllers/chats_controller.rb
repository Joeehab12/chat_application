class ChatsController < ApplicationController
    before_action :set_chat, only: [:show, :update, :destroy]
    # POST /applications/:token/chats
    def create
        @chat = Chat.create(chat_params)
        # @messages_count = Message.where(chat_id: @chat.id).count
        # @chat.update_attribute(:messages_count,@messages_count)

        @application = Application.where(id: @chat.app_id)
        # @application.update_attribute(chats_count: @application.chats_count + 1)
        @application.update_all(:chats_count => @application[0]["chats_count"] + 1)
        render json: @chat
    end

    #GET /applications/:token/chats
    def index
        @application = Application.where(token: params[:token])
        @chats = Chat.where(app_id: @application.ids)
        # @chats = Chat.all
        render json: @chats
        # json_response(@applications)
    end

    #GET /applications/:token/chats/:id
    def show
        render json: @chat
        # json_response(@application)
    end

    def chat_params
    # whitelist params
        # params[:messages_count] = Message.where(chat_id: params[:id]).count
        params.permit(:name, :app_id,:messages_count)
    end

    #PUT /applications/:token/chats/:id
    def update
        @application = Application.where(token: params[:token])
        @chats = Chat.where(app_id: @application.ids)
        @chat = @chats.where(id: params[:id])
        @chat.update(chat_params)
        render json: @chat
    end

    def set_chat
        @application = Application.where(token: params[:token])
        @chat_temp = Chat.where(app_id: @application.ids)
        @chat = @chat_temp.where(id: params[:id])
    end
end
