desc "Hourly cron master task"
task :cron => :environment do
  Wristwatch.run
end
