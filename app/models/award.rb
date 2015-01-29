class Award < ActiveRecord::Base

  has_and_belongs_to_many :users

  validates :name, presence: true
  validates :desc, presence: true
  validates :image_url, presence: true

  after_validation do
    self.total_completions = 0
  end

end
