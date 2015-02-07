class AddReferenceToNotifications < ActiveRecord::Migration
  def change
    add_reference :notifications, :alert, index: true
  end
end
