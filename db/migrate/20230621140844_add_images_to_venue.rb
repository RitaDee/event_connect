class AddImagesToVenue < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :images, :string
  end
end
