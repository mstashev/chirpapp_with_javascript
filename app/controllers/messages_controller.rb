class MessagesController < ApplicationController

  def create
    @chirp = Message.new(body: params['body'], user_id: User.find_by(api_token: params['api_token']).id)
    if current_user
      if @chirp.save
        render json: @chirp
      else
        render json: @chirp.errors.full_messages, status: 400
      end
    else
      require_user
    end
  end

  private

  def message_params
    params.permit(:body)
  end


end
