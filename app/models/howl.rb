class Howl < ActiveRecord::Base
  acts_as_votable
  
  validates :image, presence: true
  validates :caption, length: { minimum: 3, maximum: 300 }
  validates :user_id, presence: true

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user
  has_many :barkbacks, dependent: :destroy
end
