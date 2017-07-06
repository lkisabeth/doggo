class HowlsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @howls = Howl.all
  end

  def new
    @howl = Howl.new
  end

  def create
    if @howl = Howl.create(howl_params)
      redirect_to howls_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @howl.update(howl_params)
      redirect_to(howls_path(@howl))
    else
      render :edit
    end
  end

  def destroy
    @howl.destroy
    redirect_to root_path
  end

  private
    def howl_params
      params.require(:howl).permit(:image, :caption)
    end

    def set_howl
      @howl = Howl.find(params[:id])
    end

end
