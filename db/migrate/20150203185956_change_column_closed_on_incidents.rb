class ChangeColumnClosedOnIncidents < ActiveRecord::Migration
  def change
    remove_column :incidents, :closed
  end
end
