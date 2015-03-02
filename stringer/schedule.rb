require 'rufus/scheduler'
require 'rubygems'

scheduler = Rufus::Scheduler.new

scheduler.interval '10m' do
  # Refresh feeds every 10 minutes
  system "bundle exec rake -f Rakefile fetch_feeds"
end

scheduler.interval '30d' do
  # Cleanup old feeds once a month at 0100
  system "bundle exec rake -f Rakefile cleanup_old_stories"
end

scheduler.join
