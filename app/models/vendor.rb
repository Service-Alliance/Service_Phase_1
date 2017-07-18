# == Schema Information
#
# Table name: vendors
#
#  id                               :integer          not null, primary key
#  category_type                    :string
#  name                             :string
#  contact                          :string
#  phone                            :string
#  cellphone                        :string
#  fax                              :string
#  address                          :string
#  wc                               :date
#  liability                        :date
#  pollution                        :date
#  auto                             :date
#  w9                               :string
#  independent_contractor_agreement :string
#  email                            :string
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  active                           :boolean          default(TRUE)
#

class Vendor < ActiveRecord::Base
  belongs_to :category, class_name: "VendorCategory"
  has_many :vendor_uploads
  has_many :notes, as: :noteable, dependent: :destroy
  has_many :trackers, as: :trackable, dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  has_many :customer_vendors
  has_many :customers, through: :customer_vendors
  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :notes
end
