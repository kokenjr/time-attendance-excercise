class CreateWorkTimes < ActiveRecord::Migration
  def change
    create_table :work_times do |t|
      t.integer :user_id
      t.datetime :clocked_in_at
      t.datetime :clocked_out_at

      t.timestamps
    end
  end
end
