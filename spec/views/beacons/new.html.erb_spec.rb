require 'rails_helper'

RSpec.describe "beacons/new", type: :view do
  before(:each) do
    assign(:board1, @board1 = Board.new(
      :title => "Title1"
    ))
    assign(:board2, @board2 = Board.new(
      :title => "Title2"
    ))
    assign(:beacon, @beacon = Beacon.new(
      :uuid => "MyString",
      :board_id => @board2.id
    ))
  end

  it "renders new beacon form" do
    render
    assert_select "form[action=?][method=?]", beacons_path, "post" do
      assert_select "input#beacon_uuid[name=?]", "beacon[uuid]"

      # <select id="beacon_board_id" name="beacon[board_id]">
      #   <option value="@board1.id">@board1.title</option>
      #   <option value="@board2.id">@board2.title</option>
      # </select>
      assert_select "select#beacon_board_id" do
        assert_select "option[value=?]", @board1.id
        assert_select "option[value=#{@board1.id}]", :text => "Title1"
        assert_select "option[value=?]", @board2.id
        assert_select "option[value=#{@board2.id}]", :text => "Title2"
      end
    end
  end
end
