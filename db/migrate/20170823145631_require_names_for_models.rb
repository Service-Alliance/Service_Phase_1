class RequireNamesForModels < ActiveRecord::Migration
  def change
    [StructureType,
     Role,
     ReferralType,
     PricingCategory,
     PipelineStatus,
     PhoneType,
     NotifyType,
     Location,
     JobType,
     JobStatus
    ].each do |object|
      object.where(name: '').destroy_all
      object.where(name: nil).destroy_all

      change_column_null object, :name, false
    end
  end
end
