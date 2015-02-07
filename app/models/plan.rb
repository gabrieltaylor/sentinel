class Plan < ActiveRecord::Base
  include Koudoku::Plan
  has_many :subscriptions
  belongs_to :account
  belongs_to :coupon
end
