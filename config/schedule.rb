# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
rails_env = ENV['RAILS_ENV'] || :development

set :environment, rails_env

set :output, 'log/crontab.log'

# 全環境での設定


if rails_env.to_sym == :production
  # production環境のみで設定
end

every 1.minutes do
  runner "Tasks::YahooRss.pickup_reader"
end