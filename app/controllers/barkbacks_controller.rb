class BarkbacksController < ApplicationController
  before_action :set_howl, except: [:love, :unlove]
  before_action :set_barkback, only: [:love, :unlove]

  def index
    @barkbacks = @howl.barkbacks.order("created_at ASC")

    respond_to do |format|
      format.json { render :json => @barkbacks }
      format.html { render layout: !request.xhr? }
    end
  end

  def create
    @barkback = @howl.barkbacks.build(barkback_params)
    @barkback.user_id = current_user.id

    if @barkback.save
      respond_to do |format|
        format.json { render :json => @barkback }
        format.html { redirect_to root_path }
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

  def love #liked_by is an 'acts_as_votable' method
    if @barkback.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def unlove
    if @barkback.unliked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  private
    def barkback_params
      params.require(:barkback).permit(:content, scents_attributes: [:stench, :howl_id])
    end

    def set_howl
      @howl = Howl.find(params[:howl_id])
    end

    def set_barkback
      @barkback = Barkback.find(params[:id])
    end

end
