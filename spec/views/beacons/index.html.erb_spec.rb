require 'rails_helper'

RSpec.describe "beacons/index", type: :view do
  before(:each) do
    assign(:boards, [
      @board = Board.create!(
        :title => "Title"
      )
    ])
    assign(:beacons, [
      Beacon.create!(
        :uuid => "Uuid",
        :board_id => @board.id
      ),
      Beacon.create!(
        :uuid => "Uuid",
        :board_id => @board.id
      )
    ])
  end

  it "renders a list of beacons" do
    render
    assert_select "tr>td", :text => "Uuid".to_s, :count => 2
    assert_select "tr>td", :text => @board.title.to_s, :count => 2
  end
end
