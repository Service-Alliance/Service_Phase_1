class AddLossCauseRain < SeedMigration::Migration
  def up
    cause = LossCause.create!(name:'Rain')

    ['Water', 'Mold', 'Odor'].each do |type|
      LossCauseType.create(loss_type_id: LossType.id(type), loss_cause_id: cause.id)
    end
  end

  def down
    cause = LossCause.find_by(name:'Rain')
    LossCauseType.where(loss_cause_id: cause.id).destroy_all
    cause.destroy
  end
end
