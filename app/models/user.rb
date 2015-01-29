class User < ActiveRecord::Base

  has_secure_password

  has_many :goals_users
  has_many :goals, through: :goals_users
  has_and_belongs_to_many :awards

  # before_create do
  #   initialize_user
  # end

  before_validation do
    self.phone = phone.gsub(/[^0-9]/, "") if attribute_present?("phone")
  end

  validates :name, presence: true

  validates :email, presence: true, uniqueness: {case_sensitive: false}

  validates_confirmation_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create

  validates :password, presence: true, length: { minimum: 6 }, on: :create

  validates :phone, numericality: true, length: { is: 10 || 0},  allow_blank: true, allow_nil: true

  #NOT USING ZIP CURRENTLY
  # validates :zipcode, zipcode: true, allow_nil: true

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
