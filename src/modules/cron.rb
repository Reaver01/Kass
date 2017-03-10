module Bot
  # Schedules Cron jobs https://crontab.guru/ for reference
  module Cron
    # Does something every 10 mins
    SCHEDULER.every '10m' do
      # ...
    end

    # Does something every 30 mins
    SCHEDULER.every '30m' do
      # ...
    end

    # Does something every 3 hours
    SCHEDULER.every '3h' do
      # ...
    end

    # Does something every 24 hours
    SCHEDULER.every '24h' do
      # Kills the bot
      BOT.stop
      exit
    end

    SCHEDULER.cron '0 0 * * 0' do
      begin
        FileUtils.cp('botfiles/data.db', "botfiles/data#{Time.now.strftime('%Y%m%d')}.db")
      rescue
        puts 'Database backup failed!'
      end
    end
  end
end
