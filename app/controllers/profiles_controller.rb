class ProfilesController < ApplicationController
  before_action :my_profile, only: [:edit, :update]
  before_action :set_user

  def show
    @howls = @user.howls.order('created_at DESC')
  end

  def edit
  end

  def update
    if @user.update(profile_params)
      flash[:success] = 'Your Doggo profile has been updated!'
      redirect_to profile_path(@user.doggo_name)
    else
      @user.errors.full_messages
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  private

    def profile_params
      params.require(:user).permit(:avatar, :bio, :doggo_name)
    end

    def my_profile
      @user = User.find_by(doggo_name: params[:doggo_name])
      unless current_user == @user
        flash[:alert] = "Paws off! Your are not the doggo we're looking for!"
        redirect_to root_path
      end
    end

    def set_user
      @user = User.find_by(doggo_name: params[:doggo_name])
    end

end
