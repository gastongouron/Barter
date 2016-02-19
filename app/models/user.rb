class User < ActiveRecord::Base

  has_secure_password
  validates :email, presence: true
  has_many :swaps
  has_many :barts

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

end
