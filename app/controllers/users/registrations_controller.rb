class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @favorite = @user.build_favorite
    render :new_favorite
  end

  def create_favorite
    @user = User.new(session["devise.regist_data"]["user"])
    @favorite = Favorite.new(favorite_params)
    unless @favorite.valid?
      flash.now[:alert] = @favorite.errors.full_messages
      render :new_favorite and return
    end
    @user.build_favorite(@favorite.attributes)
    @user.save
    sign_in(:user, @user)
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def favorite_params
    params.require(:favorite).permit(:team, :player, :headcoach)
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

end
