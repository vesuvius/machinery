class Picture < ActiveRecord::Base
  attr_accessible :machine_id, :image, :remote_image_url, :remove_image
  belongs_to :machine
  mount_uploader :image, ImageUploader
end
