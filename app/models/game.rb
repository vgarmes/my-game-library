class Game < ApplicationRecord
  has_one_attached :thumbnail
  belongs_to :platform
end
