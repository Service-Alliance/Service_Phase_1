class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :role_id, default: 0
      t.string :notes
      t.integer :department_id
      t.string :title
      t.string :additional_title
      t.integer :location_id
      t.date :background_check
      t.date :online_physical
      t.date :fitness_test
      t.string :hep_b
      t.boolean :lead
      t.date :lead_expiration
      t.string :nys_mold
      t.date :nys_mold_expiration
      t.string :nys_mold_license
      t.string :bio_rec_bbp
      t.date :hartford
      t.date :pet_water
      t.date :pet_fire
      t.string :osha
      t.string :iicrc_reg
      t.date :iicrc_expiration
      t.date :cec_due
      t.integer :number_cec_due
      t.string :iicrc_wrt
      t.string :iicrc_amrt
      t.string :iicrc_asd
      t.string :iicrc_srt
      t.string :iicrc_hst
      t.string :iicrc_uft
      t.string :iicrc_odor
      t.string :iicrc_cds
      t.date :sub_1
      t.date :sub_2
      t.string :dry_book
      t.integer :login_count


      t.timestamps null: false
    end
  end
end
