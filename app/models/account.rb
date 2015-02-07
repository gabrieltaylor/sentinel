class Account < ActiveRecord::Base
  has_many :users
  has_many :services, dependent: :destroy
  has_many :incidents, dependent: :destroy
  has_one :subscription

  def get_or_create_incident_for(service)
    # existing_incidents = self.incidents.where(service: service, closed: :false)
    existing_incidents = self.incidents.where(closed: :false)
    if existing_incidents.any?
      existing_incidents.order_by(:date).first
    else
      self.incidents.create
    end
  end
end
