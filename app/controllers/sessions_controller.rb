class SessionsController < ApplicationController

  def create
    @user = User.find_by(username_email: params[:username_email])&.authenticate(params[:password])
    if @user
      render json: @user, serializer: UserExtendedSerializer
    else
      render json: ["Incorrect."], status: 401
    end
  end
end
