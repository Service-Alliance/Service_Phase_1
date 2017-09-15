class AddPostConstruction < SeedMigration::Migration
  def up
    cause = LossCause.create!(name: "Post Construction")

    ['General Cleaning', 'Power Washing','Odor'].each do |loss_type|
      LossCauseType.create(
        loss_type_id: LossType.id(loss_type),
        loss_cause_id: cause.id
      )
    end
  end

  def down
    cause = LossCause.find_by(name:"Post Construction")

    LossCauseType.where(loss_cause_id: cause.id).destroy_all

    cause.destroy
  end
end
