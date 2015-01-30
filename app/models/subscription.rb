class Subscription < ActiveRecord::Base
  include Koudoku::Subscription  
  belongs_to :account
  belongs_to :coupon
end
