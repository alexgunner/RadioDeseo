class CreateShowHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :show_hosts do |t|
      t.references :radio_show, foreign_key: true
      t.references :radio_host, foreign_key: true

      t.timestamps
    end
  end
end
