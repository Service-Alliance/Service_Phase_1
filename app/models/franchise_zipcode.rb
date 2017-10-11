class FranchiseZipcode < ActiveRecord::Base
  belongs_to :franchise

  scope :active, -> { where(assigned: true) }

  def self.detect_franchise(zipcode)
    active.where(zip_code: zipcode).pluck(:franchise_id).first
  end
end
