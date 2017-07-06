class BarkbacksController < ApplicationController

  def create
    @barkback = @howl.barkbacks.build(barkback_params)
    @barkback.user_id = current_user.id

    if @barkback.save
      flash[:success] = "You barked right back at the howler!"
      redirect_to :back
    else
      flash[:alert] = "That's not much of a bark. Unmuzzle yourself and try again!"
      render root_path
    end
  end

  def destroy
    @barkback = @howl.barkbacks.find(params[:id])

    @barkback.destroy
    flash[:success] = "That barkback can no longer be heard! :("
    redirect_to root_path
  end

  private
    def barkback_params
      params.require(:barkback).permit(:content)
    end

    def set_howl
      @howl = Howl.find(params[:howl_id])
    end

end
