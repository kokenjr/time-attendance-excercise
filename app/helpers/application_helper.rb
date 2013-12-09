module ApplicationHelper
  def time_diff(clocked_out, clocked_in)
    diff = clocked_out - clocked_in
    Time.at(diff.to_i.abs).utc.strftime "%H:%M:%S"
  end
end
