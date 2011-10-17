module Wristwatch
  class Railtie < Rails::Railtie
    rake_tasks do
      load "lib/wristwatch/cron.rake"
    end
  end
end