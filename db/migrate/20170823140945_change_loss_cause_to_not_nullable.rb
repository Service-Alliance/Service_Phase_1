class ChangeLossCauseToNotNullable < ActiveRecord::Migration
  def change
    LossCause.where(name:'').destroy_all

    change_column_null :loss_causes, :name, false
    change_column_null :loss_types, :name, false
  end
end
