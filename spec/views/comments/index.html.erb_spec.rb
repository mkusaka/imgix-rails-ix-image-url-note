require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        :message => "Message",
        :title => "Title"
      ),
      Comment.create!(
        :message => "Message",
        :title => "Title"
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => "Message".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
