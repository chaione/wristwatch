module Wristwatch
  class Railtie < Rails::Railtie
    rake_tasks do
      load "wristwatch/cron.rake"
    end
  end
end