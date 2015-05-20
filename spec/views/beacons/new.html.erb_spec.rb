require 'rails_helper'

RSpec.describe "beacons/new", type: :view do
  before(:each) do
    assign(:beacon, Beacon.new(
      :uuid => "MyString",
      :board_id => 1
    ))
  end

  it "renders new beacon form" do
    render

    assert_select "form[action=?][method=?]", beacons_path, "post" do

      assert_select "input#beacon_uuid[name=?]", "beacon[uuid]"

      assert_select "input#beacon_board_id[name=?]", "beacon[board_id]"
    end
  end
end
