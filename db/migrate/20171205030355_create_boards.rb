class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.string :position_one
      t.string :position_two
      t.string :position_three
      t.integer :treasure_location

      t.timestamps
    end
  end
end
