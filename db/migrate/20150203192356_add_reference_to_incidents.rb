class AddReferenceToIncidents < ActiveRecord::Migration
  def change
    add_reference :incidents, :account, index: true
  end
end
