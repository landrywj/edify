require 'rails_helper'

RSpec.describe "semesters/show", type: :view do
  before(:each) do
    @semester = assign(:semester, Semester.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
