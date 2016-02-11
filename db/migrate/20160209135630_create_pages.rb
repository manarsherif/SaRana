class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
    	t.integer :material_id

      	t.timestamps null: false
    end
  end

  def down
  	drop_table :pages
  end
end
