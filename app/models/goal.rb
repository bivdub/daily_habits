class Goal < ActiveRecord::Base

  has_many :goals_users
  has_many :users, through: :goals_users

  before_create do
    initialize_goal
  end


  def initialize_goal
    self.goal_type ||= "user"
    self.users_currently = 0
    self.users_ever = 0
    self.total_completions = 0
    self.average_streak_currently = 0
    self.average_before_breaking = 0
  end

  def new_user_on_goal
    self.users_ever += 1
    self.users_currently += 1
    self.save
  end

  def update_stats
    active_goals_users = GoalsUser.where(goal_id: self.id).where(active: true)
    goals_users = GoalsUser.where(goal_id: self.id)

    self.average_streak_currently = active_goals_users.average(:streak_completed).to_f.round(2)
    self.average_before_breaking = goals_users.average(:max_streak).to_f.round(2)
    self.total_completions += active_goals_users.where(completed_today: true).length
    self.users_ever = goals_users.length
    self.users_currently = active_goals_users.length
  end
end
