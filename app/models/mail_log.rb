class MailLog < ActiveRecord::Base
  belongs_to :user, required: false
  belongs_to :mail_loggable, polymorphic: true
end
