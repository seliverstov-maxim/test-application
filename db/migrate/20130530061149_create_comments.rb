class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :owner_id
      t.integer :story_id
      t.string :message

      t.timestamps
    end
  end
end
