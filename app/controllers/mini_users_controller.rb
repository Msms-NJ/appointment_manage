class MiniUsersController < ApplicationController
  before_action :set_mini_user, only: %i[ show edit update destroy ]

  # GET /mini_users or /mini_users.json
  def index
    @mini_users = MiniUser.page params[:page]
  end

  # GET /mini_users/1 or /mini_users/1.json
  def show
  end

  # GET /mini_users/new
  def new
    @mini_user = MiniUser.new
  end

  # GET /mini_users/1/edit
  def edit
  end

  # POST /mini_users or /mini_users.json
  def create
    @mini_user = MiniUser.new(mini_user_params)

    respond_to do |format|
      if @mini_user.save
        format.html { redirect_to @mini_user, notice: "Mini user was successfully created." }
        format.json { render :show, status: :created, location: @mini_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mini_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mini_users/1 or /mini_users/1.json
  def update
    respond_to do |format|
      if @mini_user.update(mini_user_params)
        format.html { redirect_to @mini_user, notice: "Mini user was successfully updated." }
        format.json { render :show, status: :ok, location: @mini_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mini_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mini_users/1 or /mini_users/1.json
  def destroy
    @mini_user.destroy
    respond_to do |format|
      format.html { redirect_to mini_users_url, notice: "Mini user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mini_user
      @mini_user = MiniUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mini_user_params
      params.require(:mini_user).permit(:open_id, :nick_name, :gender, :province, :country, :avatar_url, :unionid)
    end
end
