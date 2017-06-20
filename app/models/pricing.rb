class Pricing < ActiveRecord::Base
  belongs_to :job_status, foreign_key: :current_status_id, class_name: 'JobStatus'
  belongs_to :pricing_category
  has_many :uploads, as: :uploadable, dependent: :destroy
  has_many :trackers, as: :trackable, dependent: :destroy
  accepts_nested_attributes_for :uploads
end
