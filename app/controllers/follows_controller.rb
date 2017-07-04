class FollowsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @dog = Dog.find(params[:dog_id])
    current_dog.follow(@dog)
  end

  def destroy
    @dog = Dog.find(params[:dog_id])
    current_dog.stop_following(@dog)
  end
end
