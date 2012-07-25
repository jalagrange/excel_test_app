class AddPropertyIdToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :property_id, :integer
  end
end
