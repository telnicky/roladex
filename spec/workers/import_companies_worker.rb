require 'spec_helper'

describe ImportCompaniesWorker do

  describe "create_records" do
    let(:row) {
      { :name => "jose",
        :address => "123",
        :city => "miami",
        :state => "dakota",
        :zip => "44012",
        :county_code => "123",
        :phone => "1231231234",
        :employees => "1-4",
        :employee_code => "233",
        :naics => "1234",
        :ownership => "private" }
    }
    context "a valid row is given" do
      it "creates a company" do
        subject.create_records(row)
        expect(::Company.where(:name => row[:name]))
          .to be_present
      end
    end
  end

end
