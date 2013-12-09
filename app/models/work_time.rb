class WorkTime < ActiveRecord::Base
  belongs_to :user

  def set_locked_out_at(id)
    WorkTime.find_by(user_id: id).last.update_attributes(clocked_out_at: Time.now)
  end
end
