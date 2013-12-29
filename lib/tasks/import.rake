require "open-uri"
require "smarter_csv"
require "ruby-progressbar"

# csv headers
# NAME,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,COUNTYCODE,COUNTYNAME,PHONE,
# EMPRANGE,EMPRANGECODE,NAICS,OWNERSHIP
namespace :import do
  CHUNK_SIZE = 2000
  KEY_MAPPINGS = {  :name         => :name,
                    :address1     => :address1,
                    :address2     => :address2,
                    :city         => :city,
                    :state        => :state,
                    :countycode   => :county_code,
                    :countyname   => :county_name,
                    :phone        => :phone,
                    :emprange     => :employees,
                    :emprangecode => :employee_code,
                    :naics        => :naics,
                    :ownership    => :ownership
                }.freeze


  desc "imports companies and locations from a csv file found at jobs.utah.gov"
  task companies: :environment do
    slc_file = open("vendor/data/ffind_saltlake.csv")
    other_file = open("vendor/data/ffind_other.csv")
    import_csv(slc_file)
    import_csv(other_file)
  end

  def import_csv(file)
    progress = ::ProgressBar.create(:title => "import", :total => nil)
    csv_options = { :chunk_size => CHUNK_SIZE,
                    :key_mapping => KEY_MAPPINGS,
                    :strings_as_keys => true }
    SmarterCSV.process(file.path, csv_options) do |chunk|
      ImportCompaniesWorker.perform_async(chunk)
      progress.increment
    end

    progress.log("Companies: " + Company.count.to_s)
    progress.log("Locations: " + Location.count.to_s)
  end
end

