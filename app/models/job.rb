# Job
class Job < ActiveRecord::Base
  belongs_to :job_status, foreign_key: :status_id, class_name: 'JobStatus'
  belongs_to :job_type, foreign_key: :type_id, class_name: 'JobType'
  belongs_to :franchise
  belongs_to :referral_type
  belongs_to :customer
  # has_one :state, through: :customer
  has_many :calls
  belongs_to :user, foreign_key: :entered_by_id
  belongs_to :agent
  belongs_to :adjuster
  has_one :property, dependent: :destroy
  has_one :caller, dependent: :destroy
  has_many :losses, dependent: :destroy
  has_one :job_detail, dependent: :destroy
  has_one :emergency_contact, dependent: :destroy
  # has_many :uploads, dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  has_many :job_managers, dependent: :destroy
  has_many :vendor_assignments
  has_many :contact_assignments
  has_many :job_forms, dependent: :destroy
  has_many :notes, as: :noteable, dependent: :destroy
  has_many :trackers, as: :trackable, dependent: :destroy
  has_many :work_orders
  belongs_to :referral_vendor, foreign_key: :referral_vendor_id, class_name: 'Vendor'
  belongs_to :referral_employee, foreign_key: :referral_employee_id, class_name: 'User'


  # Activity Tracking activated
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  def job_loss_type
    Loss.find_by(job_id: id).try(:loss_type)
  end

  def insurance_details
    JobDetail.find_by(job_id: id).try(:insurance_company)
  end

  def update_last_action
    self.last_action = Date.today
    save
  end

  def progress
    manager_assigned = self.job_managers.any?
    manager_visited = self.job_managers.first && self.job_managers.first.schedule_date && self.job_managers.first.schedule_date >= Date.today
    estimate_created = self.estimate_created
    estimate_sent = self.estimate_sent
    contract_sent = self.contract_sent
    contract_created = self.contract_created
    if contract_sent == true
      return '96'
    elsif contract_created == true
      return '84'
    elsif estimate_sent == true
      return '70'
    elsif estimate_created == true
      return '56'
    elsif manager_visited == true
      return '42'
    elsif manager_assigned == true
      return '28'
    else
      return '14'
    end
  end



end

# {
#   "name":"Connor",
#   "description":"",
#   "emailMessage":"",
#   "autocomplete":true,
#
#    "roles": [
#     {
#       "id": "e7901eca-87bb-4891-9f93-51a8e44258c4",
#       "index": 0,
#       "type": "SIGNER",
#       "signers": [
#         {
#           "email": "creaumond@gmail.com",
#           "firstName": "Connor",
#           "lastName": "Reaumond"
#         }
#       ],
#       "name": "signer1"
#     }
#   ],
#
#   "settings": {
#     "ceremony": {
#       "inPerson":true
#     }
#   },
#   "type":"PACKAGE",
#   "due":nil,
#   "language":"en",
#   "status":"SENT"
# }

# Create new document
# HTTParty.post("https://sandbox.esignlive.com/api/packages/amUqRrobcTQo3uoRTIoVA7Y1M34=/clone", :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json', "Authorization" => "Basic bzJpaUlRcGNjaUFBOnpjQ1FBMjlsQ3UwVw=="}, body: thing)

# Download document
# HTTParty.get("https://sandbox.esignlive.com/api/packages/6x2XQiVW44ymcpHyLzpG9SBRp_Q=/documents/ad08384325cf474bf4c4075e63e38399aec3d93836c1030e/pdf", :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json', "Authorization" => "Basic bzJpaUlRcGNjaUFBOnpjQ1FBMjlsQ3UwVw=="})
