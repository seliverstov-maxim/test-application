class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :owner_id
      t.integer :performer_id
      t.string :state
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
