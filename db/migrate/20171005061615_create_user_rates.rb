class CreateUserRates < ActiveRecord::Migration
  def change
    create_table :user_rates do |t|
      t.references :user, index: true, foreign_key: {on_delete: :cascade}
      t.decimal :amount
      t.integer :period
      t.boolean :salaried
      t.boolean :exempt

      t.timestamps null: false
    end
  end
end
