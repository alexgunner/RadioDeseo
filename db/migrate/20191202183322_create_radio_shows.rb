class CreateRadioShows < ActiveRecord::Migration[5.2]
  def change
    create_table :radio_shows do |t|
      t.string :name

      t.timestamps
    end
  end
end
