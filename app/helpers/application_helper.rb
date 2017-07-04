module ApplicationHelper
  def current_dog
    return unless session[:dog_id]
    @current_dog ||= Dog.find(session[:dog_id])
  end

end
