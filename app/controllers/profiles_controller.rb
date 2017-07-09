class ProfilesController < ApplicationController

  def show
    @user = User.find_by(doggo_name: params[:doggo_name])
    @howls = @user.howls.order('created_at DESC')
  end

  def edit
    @user = User.find_by(doggo_name: params[:doggo_name])
  end

  def update
    @user = User.find_by(doggo_name: params[:doggo_name])
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
      params.require(:user).permit(:avatar, :bio)
    end

end
