class FranchiseZipcode < ActiveRecord::Base
  belongs_to :franchise, required: true

  validates_uniqueness_of :zip_code, conditions: -> { assigned }

  scope :assigned, -> { where(assigned: true) }

  def self.detect_franchise(zipcode)
    assigned.where(zip_code: zipcode).pluck(:franchise_id).first
  end
end
