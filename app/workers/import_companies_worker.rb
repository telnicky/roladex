class ImportCompaniesWorker
  include Sidekiq::Worker

  COMPANY_ATTR = [ :name ].freeze
  LOCATION_ATTR = [ :address,
                    :city,
                    :state,
                    :zip,
                    :county_code,
                    :phone,
                    :employees,
                    :employee_code,
                    :naics,
                    :ownership ].freeze
  def perform(chunk)
Sidekiq.logger.warn "foo"
    create_records(chunk.first)
  #  chunk.each do |row|
  #    create_records(row)
  #  end
  end

  def create_records(row)
    row[:address] = row.delete(:address1)
    row[:address] = row[:address] + " " + row.delete(:address2) if row[:address2].present?
    company = Company.find_or_create_by(row.slice(*COMPANY_ATTR))
    location_attr = row.slice(*LOCATION_ATTR).merge({ :company_id => company.id})
    Location.find_or_create_by(location_attr)
  end
end
