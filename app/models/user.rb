class User < ActiveRecord::Base

  validates :timecoin, :numericality => { :greater_than_or_equal_to => 0 }
  has_secure_password
  validates :email, presence: true
  has_many :services
  has_many :helps

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

end
