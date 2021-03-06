class Oncall < ActiveRecord::Base
  belongs_to :user

  def self.load_oncalls(params)

    date = params[:scheduled_on]
    priorities = params[:priorities]
    user_ids = params[:user_ids]
    add_count = user_ids.count
    clear_oncalls(date)

    p params

    add_count.times do |index|
      unless priorities[index] == ""
        p priorities[index]
        p user_ids[index]
        Oncall.create(user_id: user_ids[index], priority: priorities[index], scheduled_on: date)
      end
    end
  end

  def self.clear_oncalls(date)
    Oncall.where(scheduled_on: date).destroy_all
  end

  def as_json(options = {})
    {
      :id => self.id,
      :title => self.try(:user).try(:full_name),
      :start => self.scheduled_on.beginning_of_day,
      :end => self.scheduled_on.beginning_of_day,
      :allDay => true,
     }
     end

end
