class Beacon < ActiveRecord::Base
  belongs_to :board, class_name: Board
end
