class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_authenticity_token, if: :json_request?


  def json_request?
    request.format.json?
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    if json_request?
      email = params[:email] if params[:appid]
      password = params[:password] if params[:appsecret]

      id = User.find_by(email: email).try(:id) if email.presence

      # Validations
      if request.format != :json
        render status: 406, json: { message: 'The request must be JSON.' }
        return
      end

      if email.nil? or password.nil?
        render status: 400, json: { message: 'The request MUST contain the user email and password.' }
        return
      end

      # Authentication
      user = User.find_by(email: email)

      if user
        if user.valid_password? password
          user.reset_authentication_token!
          # Note that the data which should be returned depends heavily of the API client needs.
          render status: 200, json: { email: user.email, authentication_token: user.authentication_token, id: id }
        else
          render status: 401, json: { message: 'Invalid email or password.' }
        end
      else
        render status: 401, json: { message: 'Invalid email or password.' }
      end
    else
      #if json_request? == false
      super
    end
  end

  # DELETE /resource/sign_out
  def destroy
    if json_request?

      # Fetch params
      user = User.find_by(authentication_token: params[:user_token])

      if user.nil?
        render status: 404, json: { message: 'Invalid token.' }
      else
        user.authentication_token = nil
        user.save!
        render status: 204, json: nil
      end
    else
      super
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
