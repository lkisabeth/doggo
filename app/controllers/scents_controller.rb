class ScentsController < ApplicationController
  before_action :set_howl

  def create
    @scent = @howl.scents.build(scents_params)
    @scent.howl_id = @howl.id

    if @scent.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "Sniff..Sniff..weird...can't smell anything!"
      render root_path
    end
  end

  private
    def scents_params
      params.require(:scent).permit(:stench, :howl_id)
    end

    def set_howl
      @howl = Howl.find(params[:howl_id])
    end

end
