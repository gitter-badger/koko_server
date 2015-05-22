class Beacon < ActiveRecord::Base
  validates :uuid, :presence => true

  belongs_to :board, class_name: Board
end
