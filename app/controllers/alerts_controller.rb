class AlertsController < ApplicationController
  respond_to :xml, only: :speak

  def speak
    @alert = Alert.find params[:alert_id]
    @incident = Incident.find params[:incident_id]
  end
  
end
