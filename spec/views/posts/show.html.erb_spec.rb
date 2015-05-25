require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @board = assign(:board, Board.create!(
      :title => "Test Board"
    ))
    @post = assign(:post, Post.create!(
      :content => "MyText",
      :board_id => @board.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Test Board/)
  end
end
