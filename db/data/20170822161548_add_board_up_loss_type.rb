class AddBoardUpLossType < SeedMigration::Migration
  def up
    LossType.create(name:'Board Up')
  end

  def down
    LossType.find_by(name:'Board Up').delete
  end
end
