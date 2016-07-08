require 'rails_helper'

RSpec.describe "photos/index", :type => :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :name => "Name",
        :base_url => "Base Url",
        :filter => "Filter",
        :final_url => "Final Url"
      ),
      Photo.create!(
        :name => "Name",
        :base_url => "Base Url",
        :filter => "Filter",
        :final_url => "Final Url"
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Base Url".to_s, :count => 2
    assert_select "tr>td", :text => "Filter".to_s, :count => 2
    assert_select "tr>td", :text => "Final Url".to_s, :count => 2
  end
end
