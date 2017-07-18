# == Schema Information
#
# Table name: job_forms
#
#  id          :integer          not null, primary key
#  document_id :string
#  signed      :boolean
#  name        :string
#  link        :string
#  form_id     :integer
#  job_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class JobFormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
