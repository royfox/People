class AddDefaultRole < ActiveRecord::Migration
  def up
  	Role.create :name => 'No Role'
  end

  def down
  	Role.delete_all(["name =?","No Role"])
  end
end
