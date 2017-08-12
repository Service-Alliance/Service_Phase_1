# == Schema Information
#
# Table name: upload_categories
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UploadCategory < ActiveRecord::Base
end
