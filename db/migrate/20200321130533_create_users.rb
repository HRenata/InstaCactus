class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :secondName
      t.string :email

      t.timestamps
    end
  end
end
