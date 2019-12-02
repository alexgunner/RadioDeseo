class CreatePostLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :post_labels do |t|
      t.references :post, foreign_key: true
      t.references :label, foreign_key: true
    end
  end
end
