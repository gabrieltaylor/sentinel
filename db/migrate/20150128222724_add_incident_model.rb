class AddIncidentModel < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :name
      t.text :description
      t.boolean :acknowledged
      t.timestamp :closed
 
      t.timestamps null: false
    end

    create_table :alerts do |t|
      t.string :subject
      t.text :message

      t.timestamps null: false
    end
    add_reference :alerts, :incident, index: true
  end
end
