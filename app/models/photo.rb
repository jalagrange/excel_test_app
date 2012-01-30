class Photo < ActiveRecord::Base
  belongs_to :property
  mount_uploader :image, PhotoUploader
end
