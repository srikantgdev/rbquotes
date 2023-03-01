class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created successfully"
      self.current_user = @user
      redirect_to quotes_path, status: :see_other
    else
      flash.now[:alert] = "Errors found: #{@user.errors.full_messages}"
      render :index, status: :unprocessable_entity
    end
  end

  def new
  end

  def save
  end

  def login
    @user = User.new
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:username])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username)
    end
end
