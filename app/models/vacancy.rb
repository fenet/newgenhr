class Vacancy < ApplicationRecord
	mount_uploader :vacancy_photo, VacancyPhotoUploader 
	belongs_to :admin
end
