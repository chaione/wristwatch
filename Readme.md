Wristwatch
==========
Need to run timer-based tasks, but you have no control over your cron?
Heroku's hourly cron got you puzzled? Wristwatch is here to help.

How-to
------
Tell it what to do in `config/wristwatch_jobs.rb`, and which intervals to use,
and Wristwatch does the rest:

    hourly "Flush unsent emails" do
      Notifier.flush_unsent
    end

    daily "Reindex Solr" do
      Rake::Task['sunspot:reindex'].execute
    end

    daily "Send reminder emails" do
      Notifier.remind_users_to_call_mom
    end

Wristwatch gives you lots of basic intervals to play with:
* hourly
* bi-hourly
* quarter-hourly
* bi-daily
* daily
* weekly
* bi-monthly
* monthly

and so on. See intervals.rb for details, and re-open it to add your own
task triggers.

Future
------
Full configuration, logging and more. Stay tuned!

Copyright
---------
(The MIT License)

Copyright © 2011 (Scott Burton, ChaiOne)
