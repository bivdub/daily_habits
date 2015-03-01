class GoalsUser < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user

  validates :goal_id, presence: true, on: :create

  before_create do
    initialize_gu
    self.goal.new_user_on_goal if self.goal
  end

  def gu_update
    if self.completed_today
      self.streak_completed += 1
      self.streak_failed = 0
      if self.streak_completed > self.max_streak
        self.max_streak = self.streak_completed
      end
    end
  end

  def reset
    if self.completed_today
      self.completed_today = false
    else
      self.streak_completed = 0
      self.streak_failed += 1
      if streak_failed > self.max_failed
        self.max_failed = self.streak_failed
      end
    end
    self.save
  end

  private

  def initialize_gu

    self.streak_completed = 0
    self.streak_failed = 0
    self.completed_today = false
    self.max_streak = 0
    self.max_failed = 0
    self.active = true

  end

end
