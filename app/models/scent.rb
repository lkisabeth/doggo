class Scent < ApplicationRecord
  belongs_to :howl

  enum stench: [:cat, :rose, :food, :human_butt, :doggo_butt]
end
