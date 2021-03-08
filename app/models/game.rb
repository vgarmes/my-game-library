class Game < ApplicationRecord
  has_one_attached :thumbnail # If the :dependent option isn't set, all the attachments will be purged (i.e. destroyed) whenever the record is destroyed
  belongs_to :platform
  validates :title, :platform, presence: true
end
