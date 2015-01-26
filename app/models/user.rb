class User < ActiveRecord::Base

  has_secure_password

  has_many :goals_users
  has_many :goals, through: :goals_users
  has_and_belongs_to_many :awards

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}

  validates_confirmation_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create


  def self.authenticate email,password
    User.find_by_email(email).try(:authenticate, password)
  end



end
