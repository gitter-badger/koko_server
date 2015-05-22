require 'rails_helper'

RSpec.describe "beacons/edit", type: :view do
  before(:each) do
    @board1 = assign(:board1, Board.new(
      :title => "Title1"
    ))
    @board2 = assign(:board2, Board.new(
      :title => "Title2"
    ))
    @beacon = assign(:beacon, Beacon.create!(
      :uuid => "MyString",
      :board_id => @board2.id
    ))
  end

  it "renders the edit beacon form" do
    render

    assert_select "form[action=?][method=?]", beacon_path(@beacon), "post" do

      assert_select "input#beacon_uuid[name=?]", "beacon[uuid]"
      assert_select "input#beacon_uuid[value=?]", @beacon.uuid

      # <select id="beacon_board_id" name="beacon[board_id]">
      #   <option value="@board1.id">@board1.title</option>
      #   <option value="@board2.id" selected>@board2.title</option>
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
