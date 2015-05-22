require 'rails_helper'

RSpec.describe "beacons/show", type: :view do
  before(:each) do
    @board = assign(:board, Board.create!(
      :title => "Title"
    ))
    @beacon1 = assign(:beacon, Beacon.create!(
      :uuid => "Uuid1",
      :board_id => @board.id
    ))
    @beacon2 = assign(:beacon, Beacon.create!(
      :uuid => "Uuid2",
      :board_id => nil
    ))
  end

  it "renders UUID in <p> and hyperlink to the board with its title" do
    render
    expect(rendered).to match(/Uuid/)
    assert_select "a[href=/board/#{@board.id}", :text => @board.title
    assert_select "a", :text => "-"
  end
end
