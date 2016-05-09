require 'rails_helper'

RSpec.describe "offerings/index", type: :view do
  before(:each) do
    assign(:offerings, [
      Offering.create!(
        :semester => nil,
        :course => nil,
        :credits => 1,
        :format => "Format",
        :building_id => 2,
        :room_id => 3
      ),
      Offering.create!(
        :semester => nil,
        :course => nil,
        :credits => 1,
        :format => "Format",
        :building_id => 2,
        :room_id => 3
      )
    ])
  end

  it "renders a list of offerings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Format".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
