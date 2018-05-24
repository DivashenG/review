class User < ApplicationRecord
  attr_accessor :encrypt_password

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  validates :name, :surname, :date_of_birth, :gender, :encrypted_password, :presence => true
  validates :email_address, :presence => true , :format => EMAIL_REGEX

  #TODO: Add a password confirmation text_field and length validation on register
  # validates :password, :confirmation => true #password_confirmation attr
  # validates_length_of :password, :in => 6..20, :on => :create

  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if encrypted_password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(encrypted_password, salt)
    end
  end

  def clear_password
    self.encrypted_password = nil
  end
end
