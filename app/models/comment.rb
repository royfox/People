class Comment < ActiveRecord::Base
  belongs_to :person
  attr_accessible :body, :commenter
end
