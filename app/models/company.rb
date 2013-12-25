require 'csv'

class Company < ActiveRecord::Base
  has_many :locations

  def self.import_csv(file)
    CSV.foreach(file.path,
                headers: true,
                skip_lines: /^[^,]+$/,
                header_converters: lambda { |h| h.try(:downcase) }) do |row|
      binding.pry
      hashed_row = row.to_hash
      if hashed_row.present?
        address = hashed_row.delete["address1"] + " " + hashed_row.delete["address2"]
        hashed_row["address"] = address
        company_attr = hashed_row.slice([])
      end
    end
  end

end
