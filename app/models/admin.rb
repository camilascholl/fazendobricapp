require "digest"

class Admin < ApplicationRecord
  attr_reader :password

  before_validation :normalize_email

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  def password=(value)
    @password = value
    self.encrypted_password = self.class.digest_password(value) if value.present?
  end

  def authenticate(password_attempt)
    return false if encrypted_password.blank? || password_attempt.blank?

    ActiveSupport::SecurityUtils.secure_compare(
      encrypted_password,
      self.class.digest_password(password_attempt)
    )
  end

  def self.authenticate(email, password)
    admin = find_by(email: email.to_s.strip.downcase)
    admin if admin&.authenticate(password)
  end

  def self.digest_password(password)
    Digest::SHA256.hexdigest("#{Rails.application.secret_key_base}--#{password}")
  end

  private

  def normalize_email
    self.email = email.to_s.strip.downcase
  end
end
