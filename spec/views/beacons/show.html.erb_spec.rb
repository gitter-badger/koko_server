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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Uuid/)
    expect(rendered).to match(/Title/)
  end
end
