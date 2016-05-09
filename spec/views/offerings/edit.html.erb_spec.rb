require 'rails_helper'

RSpec.describe "offerings/edit", type: :view do
  before(:each) do
    @offering = assign(:offering, Offering.create!(
      :semester => nil,
      :course => nil,
      :credits => 1,
      :format => "MyString",
      :building_id => 1,
      :room_id => 1
    ))
  end

  it "renders the edit offering form" do
    render

    assert_select "form[action=?][method=?]", offering_path(@offering), "post" do

      assert_select "input#offering_semester_id[name=?]", "offering[semester_id]"

      assert_select "input#offering_course_id[name=?]", "offering[course_id]"

      assert_select "input#offering_credits[name=?]", "offering[credits]"

      assert_select "input#offering_format[name=?]", "offering[format]"

      assert_select "input#offering_building_id[name=?]", "offering[building_id]"

      assert_select "input#offering_room_id[name=?]", "offering[room_id]"
    end
  end
end
