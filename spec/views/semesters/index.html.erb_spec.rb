require 'rails_helper'

RSpec.describe "semesters/index", type: :view do
  before(:each) do
    assign(:semesters, [
      Semester.create!(
        :name => "Name"
      ),
      Semester.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of semesters" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
