class Person < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :state_id, :documents_attributes
  
  validates :name,  :presence => true,
                    :uniqueness => true
  validates :email, :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  
  has_many :comments
  belongs_to :state
  
  has_many :documents, :dependent => :destroy
  accepts_nested_attributes_for :documents, :allow_destroy => true
  
end
