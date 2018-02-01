class Chemical < ActiveRecord::Base
	validates :name, :sp_number, :purchase_unit, presence: true
end
