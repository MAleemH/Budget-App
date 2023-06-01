class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
