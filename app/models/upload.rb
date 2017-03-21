class Upload < ActiveRecord::Base
  belongs_to :uploadable, polymorphic: true
  mount_uploader :upload, UploadUploader
  
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def file_name
    return upload.file.filename
  end
end
