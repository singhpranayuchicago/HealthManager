class AddAmountToDrugs < ActiveRecord::Migration[6.0]
  def change
    add_column :drugs, :amount, :string
  end
end
