class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :character_name
      t.integer :show_id
    end 
  end
end
