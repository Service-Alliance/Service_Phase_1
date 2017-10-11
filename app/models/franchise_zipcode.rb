class FranchiseZipcode < ActiveRecord::Base
  belongs_to :franchise

  def self.detect_franchise(zipcode)
    where(zip_code: zipcode).pluck(:franchise_id).first
  end
end
