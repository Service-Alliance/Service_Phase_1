class UserRate < ActiveRecord::Base
  enum period: {hour: 0, day: 1, month: 2}

  belongs_to :user

  def display_with_period
    "$#{amount} per #{period}"
  end
end
