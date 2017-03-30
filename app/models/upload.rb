class Upload < ActiveRecord::Base
  belongs_to :uploadable, polymorphic: true
  belongs_to :upload_category
  mount_uploader :upload, UploadUploader

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def file_name
    return self.upload.file.path.split("/").last
  end
end
