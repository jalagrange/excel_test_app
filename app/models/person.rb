class Person < ActiveRecord::Base
    mount_uploader :name, ExcelUploader
  validates_presence_of :first_name, :last_name
  
end
