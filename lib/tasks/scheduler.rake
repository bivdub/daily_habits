desc "This task is called by the Heroku scheduler add-on"
task :update_stats => :environment do
  puts "Updating feed..."
  Goal.all.map do |goal|
    goal.update_stats
    goal.save
  end
  GoalsUser.all.map do |goal|
    goal.reset
    goal.save
  end
  puts "done."
end

task :email_notify_po_inc => :environment do
  puts "sending emails..."
  User.all.select{|user| user.po_email != nil}.each do |user|
    puts "user_id: #{user.id} - po: #{user.po_email}"
    user_po = user.po_email
    goals_users = user.goals_users
    failed_goals = goals_users.select{|goal| goal.active && !goal.completed_today}
    if failed_goals && user_po
      UserMailer.email_notify_po_inc(user).deliver_now
    end
  end
end

task :send_text_push => :environment do
  User.all.select{|user| user.phone == "13045490748"}.each do |user|
    puts "user_id #{user.id} - phone: #{user.phone}"
    goals_users = user.goals_users
    failed_goals = goals_users.select{|goal| goal.active && !goal.completed_today}
    if failed_goals && user.phone
      ApplicationController.send_text_push(user)
    end
  end
  puts "sending text..."
end


# task :send_text => :environment do
#   puts "sending text..."
#   User.all.each do |user|
#     puts "user_id #{user.id} - phone: #{user.phone}"
#     goals_users = user.goals_users
#     failed_goals = goals_users.select{|goal| goal.active && !goal.completed_today}
#     if failed_goals && user.phone!=nil
#       ApplicationController.send_text_push(user)
#     end
#   end
# end



# task :send_reminders => :environment do
#   User.send_reminders
# end