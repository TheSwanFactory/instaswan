require 'rails_helper'

RSpec.describe "photos/edit", :type => :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :name => "MyString",
      :base_url => "MyString",
      :filter => "MyString",
      :final_url => "MyString"
    ))
  end

  it "renders the edit photo form" do
    render

    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do

      assert_select "input#photo_name[name=?]", "photo[name]"

      assert_select "input#photo_base_url[name=?]", "photo[base_url]"

      assert_select "input#photo_filter[name=?]", "photo[filter]"

      assert_select "input#photo_final_url[name=?]", "photo[final_url]"
    end
  end
end
