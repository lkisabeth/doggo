module HowlsHelper
  def form_image_select(howl)
    return image_tag howl.image.url(:medium), id: 'image-preview', class: 'img-responsive' if howl.image.exists?
    image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
  end

  def display_loves(howl)
    votes = howl.votes_for.up
    return list_lovers(votes) if votes.size <= 8
    count_lovers(votes)
  end

  def loved_howl(howl)
    return 'glyphicon-heart' if current_user.voted_for? howl
    'glyphicon-heart-empty'
  end

  private

    def list_lovers(votes)
      doggo_names = []
      unless votes.blank?
        votes.voters.each do |voter|
          doggo_names.push(link_to voter.doggo_name, profile_path(voter.doggo_name), class: 'doggo-name')
        end
        doggo_names.to_sentence.html_safe + love_plural(votes)
      end
    end

    def count_lovers(votes)
      vote_count = votes.size
      vote_count.to_s + ' loves'
    end

    def love_plural(votes)
      return 'love this' if votes.count > 1
      'loves this'
    end
end
