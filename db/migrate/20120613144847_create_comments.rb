class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :person

      t.timestamps
    end
    add_index :comments, :person_id
  end
end
