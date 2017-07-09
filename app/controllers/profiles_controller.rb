class ProfilesController < ApplicationController

  def show
    @howls = User.find_by(doggo_name: params[:doggo_name]).howls.order('created_at DESC')
  end

end
