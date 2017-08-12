# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  content     :text
#  title       :string
#  author_id   :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Article < ActiveRecord::Base
  belongs_to :author, foreign_key: :author_id, class_name: "User"
  has_many :uploads, as: :uploadable, dependent: :destroy
  mount_uploader :upload, UploadUploader

end
