class Pricing < ActiveRecord::Base
  belongs_to :job_status, foreign_key: :current_status_id, class_name: 'JobStatus'
  belongs_to :pricing_category, required: true
  belongs_to :job
  has_many :uploads, as: :uploadable, dependent: :destroy
  has_many :trackers, as: :trackable, dependent: :destroy
  has_many :trackers_as_child, as: :child_trackable, dependent: :destroy, class_name: 'Tracker'
  accepts_nested_attributes_for :uploads

  delegate :name, to: :pricing_category, allow_nil: true, prefix: true

  validates :non_taxable_amount, :taxable_amount, :tax_amount, presence: true

  scope :latest_per_job, -> {
    select('DISTINCT on (job_id) *')
      .order('job_id, created_at DESC')
  }

  def subtotal
    return 0 if non_taxable_amount.nil? || taxable_amount.nil?
    non_taxable_amount + taxable_amount
  end

  def total
    return 0 if subtotal.nil? || tax_amount.nil?
    subtotal + tax_amount
  end
  alias_method :price, :total

  def tax_rate
    rate = job.try(:caller).try(:address).try(:state).try(:tax_rate)
    rate || 0
  end
end
