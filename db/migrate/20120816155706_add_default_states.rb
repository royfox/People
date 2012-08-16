class AddDefaultStates < ActiveRecord::Migration
  def up
  	State.create :name => 'New', :position => 1
  end

  def down
  	State.delet_all(["name =?","New"])
  end
end
