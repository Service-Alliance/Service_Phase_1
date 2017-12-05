class JobManager < ActiveRecord::Base
  include PgSearch

  belongs_to :job_manager, class_name: "User"
  belongs_to :job

  include PublicActivity::Model

  delegate :full_name, :first_name, :last_name, :phone_numbers, to: :job_manager, allow_nil: true
  delegate :id, :name, to: :job, allow_nil: true, prefix: true

  pg_search_scope :text_search,
    associated_against: {users: [:first_name, :last_name]},
    using: {tsearch: {prefix: true}}

  def user_id
    job_manager.try(:id)
  end
end
