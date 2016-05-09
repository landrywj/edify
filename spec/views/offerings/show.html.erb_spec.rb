require 'rails_helper'

RSpec.describe "offerings/show", type: :view do
  before(:each) do
    @offering = assign(:offering, Offering.create!(
      :semester => nil,
      :course => nil,
      :credits => 1,
      :format => "Format",
      :building_id => 2,
      :room_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Format/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
