class Person < ActiveRecord::Base
    mount_uploader :name, ExcelUploader
  validates_presence_of :first_name, :last_name

  def self.delayed_job(name)
    find_by_first_name("Nakarid").delayed_job
  end

  def delayed_job
    sleep 10 # simulate long newsletter delivery
    update_attribute(:last_name => "rico")
  end
  handle_asynchronously :delayed_job

end
