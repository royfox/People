class AddEmailAndPhoneToPerson < ActiveRecord::Migration
  def change
    add_column :people, :email, :string
    add_column :people, :phone, :string
  end
end
