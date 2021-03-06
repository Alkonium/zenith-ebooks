class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :province
  # attr_accessible :username, :email, :password, :password_confirmation
  EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :penName, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  validates :password, presence: true
  validates_length_of :password, in: 6..20, on: :create

  before_save :encrypt_password
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, salt)
    end
end

  def self.authenticate(username_or_email = '', login_password = '')
    user = if EMAIL_REGEX.match(username_or_email)
             User.find_by_email(username_or_email)
           else
             User.find_by_username(username_or_email)
             end
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end

  def match_password(login_password = '')
    password == BCrypt::Engine.hash_secret(login_password, salt)
  end
end
