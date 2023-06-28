class AddImagesToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :images, :string
  end
end
