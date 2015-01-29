class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :services, dependent: :destroy

  def notify(service, subject, message)
    @client = Twilio::REST::Client.new
    @client.account.calls.create({
      :from => '+2267795687',
      :method => 'GET',
      :fallback_method => 'GET',
      :status_callback_method => 'GET',
      :record => 'false'
    })

  end
end
