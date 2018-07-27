class Blog < ApplicationRecord
	mount_uploader :blog_photo, BlogPhotoUploader
	belongs_to :admin
end
