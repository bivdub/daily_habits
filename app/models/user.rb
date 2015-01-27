class User < ActiveRecord::Base

  has_secure_password

  has_many :goals, through: :goals_users
  has_and_belongs_to_many :awards

  # before_create do
  #   initialize_user
  # end

  # before_validation do
  #   self.phone = phone.gsub(/[^0-9]/, "") if attribute_present?("phone")
  #   self.zipcode = zipcode.gsub(/[^0-9]/, "") if attribute_present?("zipcode")
  # end

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  validates :email, presence: true, uniqueness: {case_sensitive: false}

  validates_confirmation_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create

  validates :password, presence: true, length: { minimum: 6 }, on: :create

  # validates :phone,
  #           format: :with => '1?\s*\W?\s*([2-9][0-8][0-9])\s*\W?\s*([2-9][0-9]{2})\s*\W?\s*([0-9]{4})(\se?x?t?(\d*))?',
  #           allow_nil: true

  validates :zipcode, zipcode: true, allow_nil: true




  def self.authenticate email,password
    User.find_by_email(email).try(:authenticate, password)
  end

  private

  def initialize_user
    self.text_alert = false
    self.email_alert = false
    self.negative = false
    self.positive = false
  end

end
