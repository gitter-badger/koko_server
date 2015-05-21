# json.extract! @beacon, :id, :uuid, :board_id, :created_at, :updated_at
json.board_id @beacon.board_id
json.title    @beacon.board.title

json.posts @beacon.board.posts, :id, :created_at, :content

json.beacons @beacon.board.beacons, :uuid
