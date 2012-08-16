class State < ActiveRecord::Base
  attr_accessible :name, :position
  has_and_belongs_to_many :email_templates
  acts_as_list
end
