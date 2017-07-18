# == Schema Information
#
# Table name: pricings
#
#  id                  :integer          not null, primary key
#  price               :decimal(8, 2)
#  pricing_category_id :integer
#  description         :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  current_status_id   :integer
#  job_id              :integer
#

class Pricing < ActiveRecord::Base
  belongs_to :job_status, foreign_key: :current_status_id, class_name: 'JobStatus'
  belongs_to :pricing_category
  has_many :uploads, as: :uploadable, dependent: :destroy
  has_many :trackers, as: :trackable, dependent: :destroy
  accepts_nested_attributes_for :uploads
end
