class Upload < ActiveRecord::Base
  belongs_to :uploadable, polymorphic: true
  belongs_to :upload_category
  mount_uploader :upload, UploadUploader
  mount_uploaders :uploads, UploadUploader

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  delegate :name, to: :upload_category, allow_nil: true, prefix: true

  def file_name
    return upload.file.present? ? upload.file.path.split("/").last : ''
  end
end
