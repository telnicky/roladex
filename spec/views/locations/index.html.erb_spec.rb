require 'spec_helper'

describe "locations/index" do
  before(:each) do
    assign(:locations, [
      stub_model(Location,
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :county_code => "County Code",
        :phone => "Phone",
        :employees => "Employees",
        :employee_code => "Employee Code",
        :naics => "Naics",
        :ownership => "Ownership",
        :company_id => 1
      ),
      stub_model(Location,
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :county_code => "County Code",
        :phone => "Phone",
        :employees => "Employees",
        :employee_code => "Employee Code",
        :naics => "Naics",
        :ownership => "Ownership",
        :company_id => 1
      )
    ])
  end

  it "renders a list of locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "County Code".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Employees".to_s, :count => 2
    assert_select "tr>td", :text => "Employee Code".to_s, :count => 2
    assert_select "tr>td", :text => "Naics".to_s, :count => 2
    assert_select "tr>td", :text => "Ownership".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
