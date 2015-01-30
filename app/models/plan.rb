class Plan < ActiveRecord::Base
  has_many :subscriptions

  include Koudoku::Plan

  belongs_to :account
  belongs_to :coupon

end
