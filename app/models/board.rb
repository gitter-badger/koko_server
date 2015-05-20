class Board < ActiveRecord::Base
  has_many :beacons, class_name: Beacon
  has_many :posts, class_name: Post, dependent: :destroy
end
