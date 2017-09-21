ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :current_sign_in_at, :sign_in_count, :created_at, :current_sign_in_at, :sign_in_count, :created_at, :first_name, :last_name, :role_id, :notes, :department_id, :title, :additional_title, :location_id, :background_check, :online_physical, :fitness_test, :hep_b, :lead, :lead_expiration, :nys_mold, :nys_mold_expiration, :nys_mold_license, :bio_rec_bbp, :hartford, :pet_water, :pet_fire, :osha, :iicrc_reg, :iicrc_expiration, :cec_due, :number_cec_due, :iicrc_wrt, :iicrc_amrt, :iicrc_asd, :iicrc_srt, :iicrc_hst, :iicrc_uft, :iicrc_odor, :iicrc_cds, :sub_1, :sub_2, :dry_book, :login_count


  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :first_name
    column :last_name
    column :role_id, default: 0
    column :notes
    column :department_id
    column :title
    column :additional_title
    column :location_id
    column :background_check
    column :online_physical
    column :fitness_test
    column :hep_b
    column :lead
    column :lead_expiration
    column :nys_mold
    column :nys_mold_expiration
    column :nys_mold_license
    column :bio_rec_bbp
    column :hartford
    column :pet_water
    column :pet_fire
    column :osha
    column :iicrc_reg
    column :iicrc_expiration
    column :cec_due
    column :number_cec_due
    column :iicrc_wrt
    column :iicrc_amrt
    column :iicrc_asd
    column :iicrc_srt
    column :iicrc_hst
    column :iicrc_uft
    column :iicrc_odor
    column :iicrc_cds
    column :sub_1
    column :sub_2
    column :dry_book
    column :login_count
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :first_name
  filter :last_name
  filter :role_id, default: 0
  filter :notes
  filter :department_id
  filter :title
  filter :additional_title
  filter :location_id
  filter :background_check
  filter :online_physical
  filter :fitness_test
  filter :hep_b
  filter :lead
  filter :lead_expiration
  filter :nys_mold
  filter :nys_mold_expiration
  filter :nys_mold_license
  filter :bio_rec_bbp
  filter :hartford
  filter :pet_water
  filter :pet_fire
  filter :osha
  filter :iicrc_reg
  filter :iicrc_expiration
  filter :cec_due
  filter :number_cec_due
  filter :iicrc_wrt
  filter :iicrc_amrt
  filter :iicrc_asd
  filter :iicrc_srt
  filter :iicrc_hst
  filter :iicrc_uft
  filter :iicrc_odor
  filter :iicrc_cds
  filter :sub_1
  filter :sub_2
  filter :dry_book
  filter :login_count

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :current_sign_in_at
      f.input :sign_in_count
      f.input :created_at
      f.input :first_name
      f.input :last_name
      f.input :role_id, collection: Role.all.collect {|x| [x.name, x.id]}, as: :select
      f.input :department_id, collection: Department.all.collect {|x| [x.name, x.id]}, as: :select
      f.input :notes
      f.input :title
      f.input :additional_title
      f.input :location_id, collection: Location.all.collect {|x| [x.name, x.id]}, as: :select
      f.input :background_check
      f.input :online_physical
      f.input :fitness_test
      f.input :hep_b
      f.input :lead
      f.input :lead_expiration
      f.input :nys_mold
      f.input :nys_mold_expiration
      f.input :nys_mold_license
      f.input :bio_rec_bbp
      f.input :hartford
      f.input :pet_water
      f.input :pet_fire
      f.input :osha
      f.input :iicrc_reg
      f.input :iicrc_expiration
      f.input :cec_due
      f.input :number_cec_due
      f.input :iicrc_wrt
      f.input :iicrc_amrt
      f.input :iicrc_asd
      f.input :iicrc_srt
      f.input :iicrc_hst
      f.input :iicrc_uft
      f.input :iicrc_odor
      f.input :iicrc_cds
      f.input :sub_1
      f.input :sub_2
      f.input :dry_book
      f.input :login_count
    end
    f.actions
  end

  controller do
  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    super
  end
end


end
