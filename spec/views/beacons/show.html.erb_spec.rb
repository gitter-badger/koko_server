require 'rails_helper'

RSpec.describe "beacons/show", type: :view do
  before(:each) do
    @beacon = assign(:beacon, Beacon.create!(
      :uuid => "Uuid",
      :board_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Uuid/)
    expect(rendered).to match(/1/)
  end
end
