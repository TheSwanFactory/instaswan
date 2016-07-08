require 'rails_helper'

RSpec.describe "photos/new", :type => :view do
  before(:each) do
    assign(:photo, Photo.new(
      :name => "MyString",
      :base_url => "MyString",
      :filter => "MyString",
      :final_url => "MyString"
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input#photo_name[name=?]", "photo[name]"

      assert_select "input#photo_base_url[name=?]", "photo[base_url]"

      assert_select "input#photo_filter[name=?]", "photo[filter]"

      assert_select "input#photo_final_url[name=?]", "photo[final_url]"
    end
  end
end
