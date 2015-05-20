require 'rails_helper'

RSpec.describe "beacons/index", type: :view do
  before(:each) do
    assign(:beacons, [
      Beacon.create!(
        :uuid => "Uuid",
        :board_id => 1
      ),
      Beacon.create!(
        :uuid => "Uuid",
        :board_id => 1
      )
    ])
  end

  it "renders a list of beacons" do
    render
    assert_select "tr>td", :text => "Uuid".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
