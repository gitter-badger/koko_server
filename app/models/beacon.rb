# Model class for Beacons. Requires UUID specification.
# Board_id can be empty. Which indicates 'Free' beacon.
class Beacon < ActiveRecord::Base
  validates :uuid, :presence => true

  belongs_to :board, class_name: Board
end
