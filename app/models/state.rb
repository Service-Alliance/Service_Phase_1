class State < ActiveRecord::Base
    validates :tax_rate, inclusion: { in: 0..10 }
    validates :name, length: { maximum: 2 }
end
