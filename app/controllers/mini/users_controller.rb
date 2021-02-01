class Mini::UsersController < Mini::ApplicationController

  def update
    printf("update")
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

end
