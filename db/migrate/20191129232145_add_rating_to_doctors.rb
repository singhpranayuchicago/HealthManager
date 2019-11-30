class AddRatingToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :rating, :integer
  end
end
