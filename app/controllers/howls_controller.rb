class HowlsController < ApplicationController
  before_action :set_howl, only: [:show, :edit, :update, :destroy]
  before_action :owned_howl, only: [:edit, :update, :destroy]

  def index
    @howls = Howl.all.order('created_at DESC').page params[:page]
  end

  def new
    @howl = current_user.howls.build
  end

  def create
    @howl = current_user.howls.build(howl_params)

    if @howl.save
      flash[:success] = "You have Howled loud and clear for all to hear!"
      redirect_to howls_path
    else
      flash.now[:alert] = "Your boofer seems to be broken. Try again!"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @howl.update(howl_params)
      flash[:success] = "HOOOOOWWWWWLL!!!!!"
      redirect_to(howls_path(@howl))
    else
      flash.now[:alert] = "Your re-boofer isn't boofing. Boof again."
      render :edit
    end
  end

  def destroy
    @howl.destroy
    flash[:alert] = "That boofer has been muzzled for good."
    redirect_to root_path
  end

  private
    def howl_params
      params.require(:howl).permit(:image, :caption)
    end

    def set_howl
      @howl = Howl.find(params[:id])
    end

    def owned_howl
      unless current_user == @howl.user
        flash[:alert] = "Paws off! That's not your howl!"
        redirect_to root_path
      end
    end

end
