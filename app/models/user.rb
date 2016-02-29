class User < ActiveRecord::Base

<<<<<<< HEAD
  validates :timecoin, :numericality => { :greater_than_or_equal_to => 0 }
  #validates :password, length: {minimum: 6, maximum: 150}, allow_blank: false
  has_secure_password

=======
  has_secure_password
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :timecoin, :numericality => { :greater_than_or_equal_to => 0 }
>>>>>>> c1aeb08e5e3eb260c73297b43acfd1a6456a88ed
  validates :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_many :services
  has_many :helps


  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

end
