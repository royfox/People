class EmailTemplate < ActiveRecord::Base

  attr_accessor :state_list #dont store this field in the database - only in the object
  attr_accessible :body, :subject, :state_list
  has_and_belongs_to_many :states
  after_save :update_states

  private
  def update_states
  	states.delete_all
  	selected_states = state_list.nil? ? [] : state_list.keys.collect{|id| State.find_by_id(id)}
  	selected_states.each {|s| self.states << s}
  end

end
