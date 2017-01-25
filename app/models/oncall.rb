class Oncall < ActiveRecord::Base
  belongs_to :user

  def self.load_oncalls(params)

    date = params[:scheduled_on]
    priorities = params[:priorities]
    user_ids = params[:user_ids]
    add_count = user_ids.count
    clear_oncalls(date)

    add_count.times do |index|
      unless user_ids[index] == ""
        Oncall.create(user_id: user_ids[index], priority: priorities[index], scheduled_on: date)
      end
    end
  end

  def self.clear_oncalls(date)
    Oncall.where(scheduled_on: date).destroy_all
  end
end
