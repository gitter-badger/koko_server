# Model class for Posts.
# Requires non-empty content and board_id specification.
class Post < ActiveRecord::Base
  validates :content, :presence => true
  validate :board_id, :presence => true

  belongs_to :board, class_name: Board
end
