class CreateEmailAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :email_addresses do |t|
      t.string :address
      t.belongs_to :person, foreign_key: true

      t.timestamps
    end
  end
end
