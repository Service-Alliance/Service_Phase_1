class Customer < ActiveRecord::Base
    has_many :phones
    belongs_to :address
    # validates :email, presence: true, format: {
        # with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
        # message: 'Invalid email format.'
    # }
    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }

    def phones
      Phone.where(customer_id: self.id)
    end
end
