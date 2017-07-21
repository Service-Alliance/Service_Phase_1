class CollectionSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  validates :user_id, :length => { :in => 0..255 }, :allow_nil => false

end
