class User < ActiveRecord::Base

  has_secure_password
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :timecoin, :numericality => { :greater_than_or_equal_to => 0 }
  validates :email, presence: true
  has_many :services
  has_many :helps


  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

end
