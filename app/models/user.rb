class User < ActiveRecord::Base
  has_many :work_times

  def clock_in
    self.update_attributes(status: "CLOCKED IN")
    WorkTime.create(user_id: self.id, clocked_in_at: Time.now)
  end
end
