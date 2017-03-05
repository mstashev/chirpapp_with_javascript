class ApplicationController < ActionController::API

  def index
    # binding.pry
    render json: the_class_model.all
  end

  # def show(by_parameter = :id)
  #   binding.pry
  #   key = by_parameter
  #   parameter = {key => user_params[by_parameter]}
  #   render json: the_class_model.find_by(parameter)
  # end

private

  def the_class_model
    # binding.pry
    eval(self.lookup_context.prefixes[0].camelize.singularize)
  end

  def current_user
    @current_user ||= User.find_by(api_token: params[:api_token]) if params[:api_token]
  end

  def require_user
    unless current_user
      render json: ["You need to be logged in to do this."], status: 401
    end
  end
end
