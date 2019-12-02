class CreateRadioSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :radio_schedules do |t|
      t.time :starts_at
      t.time :ends_at
      t.integer :days

      t.timestamps
    end
  end
end
