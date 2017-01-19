class Phone < ActiveRecord::Base
  belongs_to :type, foreign_key: :type_id, class_name: "PhoneType"
  belongs_to :phoneable, polymorphic: true
end
