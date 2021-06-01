User < ApplicationRecord  #figvaper
  validates :email, :password_digest, :session_token, presence: true #V
  validates :email, :session_token, uniqueness: true
 
  after_initialize :ensure_session_token #A - also attr_reader

  def self.find_by_credentials(email, password) #F
    user = User.find_by(email: email)
    return user if user && user.is_password?(password)
  end
 
  def self.generate_session_token #G
    SecureRandom::urlsafe_base64(16)
  end
  
  def ensure_session_token #E
    User.session_token ||= User.generate_session_token
  end
  
  def reset_session_token! #R
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password) #P
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password) #I
    password_object = BCrypt::password.new(self.password_digest)
    password_object.is_password?(password) 
      #this method is the is_password of data type BCrypt
  end

end