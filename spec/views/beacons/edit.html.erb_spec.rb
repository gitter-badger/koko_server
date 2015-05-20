require 'rails_helper'

RSpec.describe "beacons/edit", type: :view do
  before(:each) do
    @beacon = assign(:beacon, Beacon.create!(
      :uuid => "MyString",
      :board_id => 1
    ))
  end

  it "renders the edit beacon form" do
    render

    assert_select "form[action=?][method=?]", beacon_path(@beacon), "post" do

      assert_select "input#beacon_uuid[name=?]", "beacon[uuid]"

      assert_select "input#beacon_board_id[name=?]", "beacon[board_id]"
    end
  end
end
