# json.extract! @beacon, :id, :uuid, :board_id, :created_at, :updated_at
begin
  json.board_id @beacon.board_id
  json.title @beacon.board.title
rescue
  json.board_id nil
  json.title ''
end

begin
  json.posts @beacon.board.posts, :id, :created_at, :content
rescue
  json.posts []
end

begin
  json.beacons @beacon.board.beacons, :uuid
rescue
  json.beacons []
end
