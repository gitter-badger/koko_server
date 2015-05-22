require 'rails_helper'

RSpec.describe "beacons/show", type: :view do
  before(:each) do
    @board = assign(:board, Board.create!(
      :title => "Title"
    ))
    @beacon = assign(:beacon, Beacon.create!(
      :uuid => "Uuid",
      :board_id => @board.id
    ))
  end

  it "renders UUID in <p> and hyperlink to the board with its title" do
    render
    expect(rendered).to match(/Uuid/)
    assert_select "a[href=/board/#{@board.id}", :text => @board.title
  end
end
