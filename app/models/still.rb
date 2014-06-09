class Still < ActiveRecord::Base
		#validations
	belongs_to :film
	validates 	:film, presence: true
	
  # Image uploader using carrierwave
    mount_uploader :image, ImageUploader
end

