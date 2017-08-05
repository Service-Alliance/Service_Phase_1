class CreateMailLogs < ActiveRecord::Migration
  def change
    create_table :mail_logs do |t|
      t.references :user, index: true
      t.string :name
      t.string :email
      t.string :subject
      t.text :body
      t.integer :mail_loggable_id
      t.string :mail_loggable_type

      t.timestamps null: false
    end
  end
end
