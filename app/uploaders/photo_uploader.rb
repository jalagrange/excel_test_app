# app/uploaders/photo_uploader.rb
class PhotoUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick

  # Include RMagick or ImageScience support:
  # include CarrierWave::RMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  storage :fog
  # storage :s3

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/tmp/"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  # "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  # # do something
  # end

  #version :thumb do
  #  process :resize_to_fit => [108, 81]
  #end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  #  %w(jpg jpeg gif png)
  
  def extension_white_list
     %w(jpg jpeg gif png xls)
   end
   
  # Override the filename of the uploaded files:
  # def filename
  # "something.jpg" if original_filename
  # end

end