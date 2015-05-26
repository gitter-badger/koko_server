@board = @beacon.board
if @board # If the beacon has an associated board
  json.board_id @board.id
  json.title @board.title

  json.posts @board.posts, :id, :created_at, :content

  json.beacons @board.beacons, :uuid
else
  json.board_id nil
  json.title ''

  json.posts []

  json.beacons []
  # json.beacons do
  #   json.uuid @beacon.uuid
  # end
end
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
