class ApplicationsController < ApplicationController
    before_action :set_application, only: [:show, :update, :destroy]
    #PUT /applications/:token

    # POST /applications
    def create
        @application = Application.create(application_params)
        @chats_count = Chat.where(app_id: @application.id).count
        @application.update_attribute(:chats_count,@chats_count)
        render json: @application
    end

    #GET /applications
    def index
        @applications = Application.all
        render json: @applications
        # json_response(@applications)
    end

    #GET /applications/:token
    def show
        render json: @application
        # json_response(@application)
    end

    #PUT /applications/:token
    def update
        @application_token = Application.where(token: params[:id])
        @application = @application_token.update(application_params_update)
        render json: @application
    end

    def application_params_update
    # whitelist params
        # params[:token] = SecureRandom.urlsafe_base64(16)
        # params[:chats_count] = Chat.where(:app_id self.i#{params[:id]}").count
        #count(:conditions => "app_id =#{params[:id]}")
        params.permit(:name, :token,:chats_count)
    end

    def application_params
    # whitelist params
        params[:token] = SecureRandom.urlsafe_base64(16)
        # params[:chats_count] = Chat.where(:app_id self.i#{params[:id]}").count
        #count(:conditions => "app_id =#{params[:id]}")
        params.permit(:name, :token,:chats_count)
    end

    def set_application
        @application = Application.where(token: params[:id])#_by token: params[:token]
    end
end
