class Incident < ActiveRecord::Base
  has_many :alerts
  belongs_to :account
end
