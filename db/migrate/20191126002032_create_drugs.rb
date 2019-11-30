class CreateDrugs < ActiveRecord::Migration[6.0]
  def change
    create_table :drugs do |t|
      t.string :description
      t.integer :user_id
      t.boolean :message_sent
      t.datetime :take_at

      t.timestamps
    end
  end
end
