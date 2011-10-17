desc "Hourly cron master task"
task :cron => :environment do
  time = Time.now
  
  Rake::Task["wristwatch:hourly"].invoke
  Rake::Task["wristwatch:bi_hourly"].invoke if time.hour.modulo(2) == 0
  Rake::Task["wristwatch:quarter_daily"].invoke if time.hour.modulo(6) == 0
  Rake::Task["wristwatch:bi_daily"].invoke if time.hour.modulo(12) == 0
  Rake::Task["wristwatch:daily"].invoke if time.hour == 0
  Rake::Task["wristwatch:weekly"].invoke if time.wday == 0 && time.hour == 0
  Rake::Task["wristwatch:bi_weekly"].invoke if ((time.day == 1 || time.day == 15) && time.hour == 0)
  Rake::Task["wristwatch:monthly"].invoke if time.day == 1 && time.hour == 0
  Rake::Task["wristwatch:bi_monthly"].invoke if time.month.modulo(2) == 1 && time.day == 1 && time.hour == 0
  Rake::Task["wristwatch:quarterly"].invoke if time.month.modulo(4) == 1 && time.day == 1 && time.hour == 0
  Rake::Task["wristwatch:semiannually"].invoke if time.month.modulo(6) == 1 && time.day == 1 && time.hour == 0
  Rake::Task["wristwatch:annually"].invoke if time.month == 1 && time.day == 1 && time.hour == 0
end

namespace :wristwatch do
  desc "Hourly"
  task :hourly => :environment do
    puts "Starting hourly cron at #{start_time = Time.now}"
    # Your code goes here
    puts "Finished hourly cron at #{end_time = Time.now}"
    puts "Elapsed time: #{end_time - start_time}s"
  end

  desc "Bi-hourly"
  task :bi_hourly => :environment do
    puts "Starting bi-hourly cron at #{start_time = Time.now}"

    puts "Finished bi-hourly cron at #{end_time = Time.now}"
    puts "Elapsed time: #{end_time - start_time}s"
  end

  desc "Every six hours"
  task :quarter_daily => :environment do
    puts "Starting quarter-hourly cron at #{start_time = Time.now}"
    
    puts "Finished quarter-hourly cron at #{end_time = Time.now}"
    puts "Elapsed time: #{end_time - start_time}s"
  end

  desc "At 12pm and 12am"
  task :bi_daily => :environment do
    puts "Starting bi-daily cron at #{start_time = Time.now}"
    
    puts "Finished bi-daily cron at #{end_time = Time.now}"
    puts "Elapsed time: #{end_time - start_time}s"
  end

  desc "At 12am"
  task :daily => :environment do
    puts "Starting daily cron at #{start_time = Time.now}"
    
    puts "Finished daily cron at #{end_time = Time.now}"
    puts "Elapsed time: #{end_time - start_time}s"
  end

  desc "On Sunday at 12am"
  task :weekly => :environment do
    puts "Starting weekly cron at #{start_time = Time.now}"
    Rake::Task["location:metrics:calculate"].invoke
    Rake::Task["deals:digest"].invoke
    puts "Finished weekly cron at #{end_time = Time.now}"
    puts "Elapsed time: #{end_time - start_time}s"
  end

  desc "Bi-weekly at 12am"
  task :bi_weekly => :environment do
    puts "Starting bi-weekly cron at #{start_time = Time.now}"
    Rake::Task["sunspot:reindex"].invoke
    puts "Finished bi-weekly cron at #{end_time = Time.now}"
    puts "Elapsed time: #{end_time - start_time}s"
  end

  desc "Monthly at 12am"
  task :monthly => :environment do
    puts "Starting monthly cron at #{start_time = Time.now}"
    
    puts "Finished monthly cron at #{end_time = Time.now}"
    puts "Elapsed time: #{end_time - start_time}s"
  end

  desc "Bi-monthly at 12am, starting in January"
  task :bi_monthly => :environment do
    puts "Starting bi-monthly cron at #{start_time = Time.now}"

    puts "Finished bi-monthly cron at #{end_time = Time.now}"
    puts "Elapsed time: #{end_time - start_time}s"
  end

  desc "Quarterly at 12am, starting in January"
  task :quarterly => :environment do
    puts "Starting quarterly cron at #{start_time = Time.now}"

    puts "Finished quarterly cron at #{end_time = Time.now}"
    puts "Elapsed time: #{end_time - start_time}s"
  end

  desc "On January 1st and July 1st, at 12am"
  task :semiannually => :environment do
    puts "Starting semiannual cron at #{start_time = Time.now}"

    puts "Finished semiannual cron at #{end_time = Time.now}"
    puts "Elapsed time: #{end_time - start_time}s"
  end

  desc "On January 1st at 12am"
  task :annually => :environment do
    puts "Starting annual cron at #{start_time = Time.now}"

    puts "Finished annual cron at #{end_time = Time.now}"
    puts "Elapsed time: #{end_time - start_time}s"
  end


end
