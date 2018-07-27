class Cv < ApplicationRecord
 mount_uploader :upload_cv , AttachmentUploader
 belongs_to :admin
	
	#    def self.search(search)
	#	where("name LIKE ?", "%#{search}%")
	#	where("name content ?", "%#{search}%")
	#   LOWER(institution_name)LIKE :search_term OR   

#	end
def self.search_by(search_term)
	where("LOWER(created_at)LIKE :search_term OR LOWER(job_category)LIKE :search_term OR LOWER(field_of_study)LIKE :search_term OR LOWER(degree_level)LIKE :search_term", search_term: "%#{search_term.downcase}%")
	end 
	

end





	     