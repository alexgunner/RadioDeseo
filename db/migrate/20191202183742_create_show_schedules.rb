class CreateShowSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :show_schedules do |t|
      t.references :radio_show, foreign_key: true
      t.references :radio_schedule, foreign_key: true

      t.timestamps
    end
  end
end
