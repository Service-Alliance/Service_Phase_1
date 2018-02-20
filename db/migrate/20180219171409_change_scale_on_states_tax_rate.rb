class ChangeScaleOnStatesTaxRate < ActiveRecord::Migration
  def up
     change_column :states, :tax_rate, :decimal, {:precision=> 8, :scale=> 5, null: false, default: 0}
  end

  def down
     change_column :states, :tax_rate, :decimal, null: false, default: 0
  end
end
