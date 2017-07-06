class HowlsController < ApplicationController

  def index
    @howls = Howl.all
  end

  def new
    @howl = Howl.new
  end

  def create
    @howl = Howl.create(howl_params)
    redirect_to howls_path
  end

  def show
    @howl = Howl.find(params[:id])
  end

  def edit
    @howl = Howl.find(params[:id])
  end

  def update
    @howl = Howl.find(params[:id])
    @howl.update(howl_params)
    redirect_to(howls_path(@howl))
  end

  private
    def howl_params
      params.require(:howl).permit(:image, :caption)
    end

end
