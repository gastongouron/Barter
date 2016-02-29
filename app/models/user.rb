class User < ActiveRecord::Base

  validates :timecoin, :numericality => { :greater_than_or_equal_to => 0 }
  #validates :password, length: {minimum: 6, maximum: 150}, allow_blank: false
  has_secure_password

  validates :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_many :services
  has_many :helps

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

end
