class Mini::SessionsController < ::DeviseTokenAuth::SessionsController

  respond_to :json
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  # skip_before_action :verify_authenticity_token


  # protect_from_forgery with: :null_session

  # Prevent session parameter from being passed
  # Unpermitted parameter: session
  # wrap_parameters format: []
  # wechat_api({ account: 'mini'})

  def create
    code = params[:code]
    if code.present?
      res = ::Wechat.api('mini').jscode2session(code)
      # res = wechat.jscode2session(code)
      tmp_user = ::MiniUser.get_by_openid(res['openid'])

      @resource = tmp_user

      @token = @resource.create_token
      @resource.save

      sign_in(:user, @resource, store: false, bypass: false)

      render_create_success
    else
      render status: :bad_request
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def auth_params
    params.require(:session).permit(:code)
  end


end
