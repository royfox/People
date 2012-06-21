class Document < ActiveRecord::Base
  attr_accessible :doc_content_type, :doc_file_name, :doc_file_size, :doc_updated_at, :person_id, :doc


  belongs_to :person
  has_attached_file :doc

end
