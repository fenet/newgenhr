class Contact < ApplicationRecord
	mount_uploader :testimony_photo, TestimonyPhotoUploader
	belongs_to :admin
end
