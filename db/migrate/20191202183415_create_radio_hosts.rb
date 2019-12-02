class CreateRadioHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :radio_hosts do |t|
      t.string :name

      t.timestamps
    end
  end
end
