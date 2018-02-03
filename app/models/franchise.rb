class Franchise < ActiveRecord::Base
  include Trackable

  belongs_to :address
  has_many :notes, as: :noteable, dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  has_many :jobs
  has_many :franchise_work_order_distributions
  has_many :work_order_distribution, through: :franchise_work_order_distributions, source: :user
  has_many :franchise_zipcodes, dependent: :destroy
  has_many :franchise_scheduling_managers
  has_many :scheduling_managers, through: :franchise_scheduling_managers, source: :user

  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :notes

  delegate :full_address, :address_without_county, to: :address, allow_nil: true
  delegate :count, to: :scheduling_managers, prefix: true

  def adwords_account_performance_report
    service = AdwordsApiAdapter.new
    service.account_performance_report(adwords_client_id)
  end
end
