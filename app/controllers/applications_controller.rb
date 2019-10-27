class ApplicationsController < ApplicationController
    before_action :set_application, only: [:show, :update, :destroy]
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

    def application_params
    # whitelist params
        params[:token] = SecureRandom.urlsafe_base64(16)
        # params[:chats_count] = Chat.where(:app_id self.i#{params[:id]}").count
        #count(:conditions => "app_id =#{params[:id]}")
        params.permit(:name, :token,:chats_count)
    end
    #PUT /applications
    def update
        @application.update(application_params)
    end

    def set_application
        @application = Application.where(token: params[:id])#_by token: params[:token]
    end
end
