class CreateEmailTemplatesStatesTable < ActiveRecord::Migration
  def up
  	create_table :email_templates_states, :id => false do |t|
  		t.references :email_template
  		t.references :state
  	end
  	add_index :email_templates_states, [:email_template_id, :state_id]
  	add_index :email_templates_states, [:state_id,:email_template_id]
  end
  

  def down
  	drop_table :email_templates_states
  end
end
