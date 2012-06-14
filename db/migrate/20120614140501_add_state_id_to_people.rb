class AddStateIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :state_id, :integer
  end
end
