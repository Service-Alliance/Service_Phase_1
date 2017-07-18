# == Schema Information
#
# Table name: phones
#
#  id             :integer          not null, primary key
#  number         :string
#  type_id        :integer
#  extension      :string
#  phoneable_id   :integer
#  phoneable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Phone < ActiveRecord::Base
  belongs_to :type, foreign_key: :type_id, class_name: "PhoneType"
  belongs_to :phoneable, polymorphic: true
end
