# == Schema Information
#
# Table name: uploads
#
#  id                 :integer          not null, primary key
#  job_id             :integer
#  upload             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  uploadable_id      :integer
#  uploadable_type    :string
#  upload_category_id :integer
#  uploads            :json
#  description        :text
#

class Upload < ActiveRecord::Base
  belongs_to :uploadable, polymorphic: true
  belongs_to :upload_category
  mount_uploader :upload, UploadUploader
  mount_uploaders :uploads, UploadUploader

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def file_name
    return self.upload.file.path.split("/").last
  end
end
