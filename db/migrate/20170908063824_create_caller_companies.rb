class CreateCallerCompanies < ActiveRecord::Migration
  def change
    create_table :caller_companies do |t|
      t.references :caller, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
