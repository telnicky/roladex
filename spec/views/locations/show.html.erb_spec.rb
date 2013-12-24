require 'spec_helper'

describe "locations/show" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zip/)
    rendered.should match(/County Code/)
    rendered.should match(/Phone/)
    rendered.should match(/Employees/)
    rendered.should match(/Employee Code/)
    rendered.should match(/Naics/)
    rendered.should match(/Ownership/)
    rendered.should match(/1/)
  end
end
