class HowlsController < ApplicationController

  def index
  end

  def new
    @howl = Howl.new
  end

  def create
    @howl = Howl.create(howl_params)
    redirect_to howls_path
  end

  private
    def howl_params
      params.require(@howl).permit(:image, :caption)
    end

end
