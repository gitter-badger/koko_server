@board = @post.board
json.board_id @board.id
json.title @board.title

json.posts @board.posts, :id, :created_at, :content

json.beacons @board.beacons, :uuid


#
# begin
#   json.board_id @board.id
#   json.title @board.title
# rescue
#   json.board_id nil
#   json.title ''
# end
#
# begin
#   json.posts @board.posts, :id, :created_at, :content
# rescue
#   json.posts []
# end
#
# begin
#   json.beacons @board.beacons, :uuid
# rescue
#   json.beacons []
# end
