json.array!(@beacons) do |beacon|
  json.extract! beacon, :id, :uuid, :board_id
  json.url beacon_url(beacon, format: :json)
end
