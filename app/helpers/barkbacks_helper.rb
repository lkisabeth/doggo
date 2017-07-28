module BarkbacksHelper
  def loved_barkback(barkback)
    return 'glyphicon-heart' if current_user.voted_for? barkback
    'glyphicon-heart-empty'
  end
end
