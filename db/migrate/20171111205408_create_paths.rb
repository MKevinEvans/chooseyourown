class CreatePaths < ActiveRecord::Migration[5.1]
  def change
    create_table :paths do |t|
      t.string :prompt
      t.string :decision1
      t.string :decision2
      t.string :path_id
      t.string :story_id

      t.timestamps
    end
  end
end
