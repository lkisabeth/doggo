class HowlsController < ApplicationController

  def index
  end

  def new
    @howl = Howl.new
  end

end
