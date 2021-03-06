class User < ActiveRecord::Base
  has_many :work_times

  def clock_in
    self.update_attributes(status: "CLOCKED IN")
    WorkTime.create(user_id: self.id, clocked_in_at: Time.now)
  end

  def clock_out
    self.update_attributes(status: "CLOCKED OUT")
    self.work_times.last.update_attributes(clocked_out_at: Time.now)
  end

  def time_worked_past_week
    self.work_times.where("clocked_in_at >= '#{7.days.ago}'")
  end

end
