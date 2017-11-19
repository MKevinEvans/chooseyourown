class AddEndedToPaths < ActiveRecord::Migration[5.1]
  def change
    add_column :paths, :ended, :boolean
  end
end
