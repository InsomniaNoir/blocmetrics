class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :registered_application, index: true, foreign_key: true
      t.string :event_name
      t.string :url
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
