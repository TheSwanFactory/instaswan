require 'rails_helper'

RSpec.describe "photos/show", :type => :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :name => "Name",
      :base_url => "Base Url",
      :filter => "Filter",
      :final_url => "Final Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Base Url/)
    expect(rendered).to match(/Filter/)
    expect(rendered).to match(/Final Url/)
  end
end
