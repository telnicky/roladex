require "open-uri"

namespace :import do
  desc "imports companies and locations from a csv file"
  task companies: :environment do
    file = open("http://jobs.utah.gov/jsp/firmfind/csvfiles/ffind_saltlake.csv")
    Company.import_csv(file)
  end

end
