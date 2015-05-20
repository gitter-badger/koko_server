class Post < ActiveRecord::Base
  belongs_to :board, class_name: Board
end
