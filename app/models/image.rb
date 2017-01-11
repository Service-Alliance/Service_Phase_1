class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
