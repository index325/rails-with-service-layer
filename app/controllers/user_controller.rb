class UserController < ApplicationController
  before_action :find_user, except: [:create]

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def activate
    Users::ActivateService.new(@user).call(params[:reason])
    render json: { message: "User #{@user.name} activated" }
  end

  def deactivate
    Users::DeactivateService.new(@user).call(params[:reason])
    render json: { message: "User #{@user.name} activated" }
  end

  def add_permission
    Permissions::CreateService.new(@user).call(params[:permission_name])
    render json: { message: "Permission #{:permission_name} created" }
  end

  def remove_permission
    Permissions::RemoveService.new(@user).call(params[:permission_name])
    render json: { message: "Permission #{:permission_name} deleted" }
  end

  private

  def user_params
    params.require(:user).permit(:name, :user_type, :active)
  end

  def find_user
    @user = User.find_by(id: params[:id])

    unless @user
      render json: { error: 'User not found' }, status: :not_found
    end
  end
end
