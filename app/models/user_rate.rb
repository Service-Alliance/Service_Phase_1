class UserRate < ActiveRecord::Base
  enum period: {hour: 0, day: 1, month: 2}

  belongs_to :user

  validates :period, :amount, presence: true, if: :period_or_amount_present?

  def display_with_period
    "$#{amount} per #{period}" if amount.present?
  end

  def period_or_amount_present?
    period.present? || amount.present?
  end
end
