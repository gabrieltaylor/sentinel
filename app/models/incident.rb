class Incident < ActiveRecord::Base
  has_many :alerts
end
