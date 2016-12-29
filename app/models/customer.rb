class Customer < ActiveRecord::Base
    has_many :phones
    belongs_to :address
    validates :email, presence: true, format: {
        with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
        message: 'Invalid email format.'
    }

    def phones
      Phone.where(customer_id: self.id)
    end
end
