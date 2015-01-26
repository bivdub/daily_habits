class GoalsUser < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user

  before_create do
    initialize_gu
    self.goal.new_user_on_goal
  end

  before_save(on: :update) do
    gu_update
  end

  def reset

    if self.completed_today && active
      self.completed_today = false
    elsif active
      self.streak_completed = 0
      self.streak_failed += 1
      if streak_failed > self.max_failed
        self.max_failed = self.streak_failed
      end
    end
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

  def gu_update

    if self.completed_today && active
      self.streak_completed += 1
      self.streak_failed = 0
      if self.streak_completed > self.max_streak
        self.max_streak = self.streak_completed
      end
    end
  end

end
