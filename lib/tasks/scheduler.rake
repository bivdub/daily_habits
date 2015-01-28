desc "This task is called by the Heroku scheduler add-on"
task :update_stats => :environment do
  puts "Updating feed..."
  Goal.all.each do |goal|
    goal.update_stats
    goal.save
  end
  GoalsUser.all.each do |goal|
    goal.reset
    goal.save
  end
  puts "done."
end



# task :send_reminders => :environment do
#   User.send_reminders
# end