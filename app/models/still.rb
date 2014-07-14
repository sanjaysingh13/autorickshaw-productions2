class Still < ActiveRecord::Base
		#validations
	belongs_to :film, touch: true
	validates 	:film, presence: true
	
  # Image uploader using carrierwave
    mount_uploader :image, ImageUploader
end

