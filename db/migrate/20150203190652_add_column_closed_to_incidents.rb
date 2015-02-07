class AddColumnClosedToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :closed, :boolean, default: :false
  end
end
