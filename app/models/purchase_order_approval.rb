# == Schema Information
#
# Table name: purchase_order_approvals
#
#  id             :integer          not null, primary key
#  date           :date
#  job_name       :text
#  vendor         :text
#  purchase_item  :text
#  amount         :text
#  last_four_card :text
#  job_id         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  description    :text
#  user_id        :integer
#

class PurchaseOrderApproval < ActiveRecord::Base
end
