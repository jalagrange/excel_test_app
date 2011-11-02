class Person < ActiveRecord::Base
  
  validates_presence_of :first_name, :last_name
  
end
