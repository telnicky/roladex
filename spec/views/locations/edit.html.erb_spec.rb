require 'spec_helper'

describe "locations/edit" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :county_code => "MyString",
      :phone => "MyString",
      :employees => "MyString",
      :employee_code => "MyString",
      :naics => "MyString",
      :ownership => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", location_path(@location), "post" do
      assert_select "input#location_address[name=?]", "location[address]"
      assert_select "input#location_city[name=?]", "location[city]"
      assert_select "input#location_state[name=?]", "location[state]"
      assert_select "input#location_zip[name=?]", "location[zip]"
      assert_select "input#location_county_code[name=?]", "location[county_code]"
      assert_select "input#location_phone[name=?]", "location[phone]"
      assert_select "input#location_employees[name=?]", "location[employees]"
      assert_select "input#location_employee_code[name=?]", "location[employee_code]"
      assert_select "input#location_naics[name=?]", "location[naics]"
      assert_select "input#location_ownership[name=?]", "location[ownership]"
      assert_select "input#location_company_id[name=?]", "location[company_id]"
    end
  end
end
