class Account < ActiveRecord::Base
  has_many :users
  has_many :services, dependent: :destroy
  has_one :subscription
end
