class AddRatingToDrugs < ActiveRecord::Migration[6.0]
  def change
    add_column :drugs, :rating, :integer
  end
end
