# Model class for Boards.
# Requires title.
# When a board ever deleted, all associated posts will also be deleted.
class Board < ActiveRecord::Base
  validates :title, :presence => true

  has_many :beacons, class_name: Beacon
  has_many :posts, class_name: Post, dependent: :destroy
end
