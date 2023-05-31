class CreateGroupPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :group_payments do |t|
      t.references :group, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
