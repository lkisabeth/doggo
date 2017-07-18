class BarkbacksController < ApplicationController
  before_action :set_howl

  def index
    @barkbacks = @howl.barkbacks.order("created_at ASC")

    respond_to do |format|
      format.html { render layout: !request.xhr? }
    end
  end

  def create
    @barkback = @howl.barkbacks.build(barkback_params)
    @barkback.user_id = current_user.id

    if @barkback.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "That's not much of a bark. Unmuzzle yourself and try again!"
      render root_path
    end
  end

  def new
    @barkback = @howl.barkbacks.new
  end

  def show
    @barkback = @howl.barkbacks.find(params[:id])
  end

  def destroy
    @barkback = @howl.barkbacks.find(params[:id])

    if @barkback.user_id == current_user.id
      @barkback.delete
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private
    def barkback_params
      params.require(:barkback).permit(:content)
    end

    def set_howl
      @howl = Howl.find(params[:howl_id])
    end

end
