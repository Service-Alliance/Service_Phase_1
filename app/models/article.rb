class Article < ActiveRecord::Base
  belongs_to :author, foreign_key: :author_id, class_name: "User"
  has_many :uploads, as: :uploadable, dependent: :destroy
  mount_uploader :upload, UploadUploader

end
