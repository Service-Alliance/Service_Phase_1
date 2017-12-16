json.extract! referral_type, :id, :name, :created_at, :updated_at, :associated_record_type, :allows_notes, :sub_types
json.associated_record_collection referral_type.associated_record_collection, partial: "#{referral_type.associated_record_type.downcase.pluralize}/#{referral_type.associated_record_type.downcase}.json.jbuilder", as: referral_type.associated_record_type.downcase.to_sym if referral_type.associated_record_type.present?
json.url referral_type_url(referral_type, format: :json)
