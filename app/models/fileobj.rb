class Fileobj < ActiveRecord::Base
  has_attached_file :image, 
	:storage => :s3,
	:s3_credentials => "#{Rails.root.to_s}/config/s3.yml",
	:path => "/:id/:filename"
  attr_accessible :image
end
