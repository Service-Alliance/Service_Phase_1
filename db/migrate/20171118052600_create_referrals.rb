class CreateReferrals < ActiveRecord::Migration
  def up
    create_table :referrals do |t|
      t.references :referral_type, index: true, foreign_key: true
      t.integer :sub_referral_type_id
      t.text :notes
      t.string :associated_record_type
      t.integer :associated_record_id

      t.timestamps null: false
    end

    add_reference :jobs, :referral, null: true, index: true, foreign_key: {on_delete: :cascade}

    Job.where.not(referral_type_id: nil).each do |job|
      if job.referral_vendor_id.present? || job.referral_employee_id.present?
        associated_record_type = job.referral_vendor_id.present? ? 'Vendor' : 'User'
        associated_record_id = job.referral_vendor_id.present? ? job.referral_vendor_id : job.referral_employee_id
      end
      job.referral = Referral.create!(
        referral_type_id: job.referral_type_id,
        notes: job.referral_note,
        associated_record_id: associated_record_id,
        associated_record_type: associated_record_type
      )
      job.save!
    end

    remove_column :jobs, :referral_type_id
    remove_column :jobs, :referral_employee_id
    remove_column :jobs, :referral_note
    remove_column :jobs, :referral_vendor_id
  end

  def down
    add_column :jobs, :referral_type_id, :integer
    add_column :jobs, :referral_employee_id, :integer
    add_column :jobs, :referral_note, :text
    add_column :jobs, :referral_vendor_id, :integer

    Referral.find_each do |ref|
      ref.job.tap do |job|
        job.referral_employee_id = ref.associated_record_id if ref.associated_record_type == 'User'
        job.referral_vendor_id = ref.associated_record_id if ref.associated_record_type == 'Vendor'
        job.referral_note = ref.notes
        job.referral_type_id = ref.referral_type_id
        job.save!
      end
    end

    remove_column :jobs, :referral_id

    drop_table :referrals
  end
end
