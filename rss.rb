require 'rss'
require 'open-uri'

require 'rufus-scheduler'

item="Just started"

scheduler = Rufus::Scheduler.new
scheduler.every '30m' do
  url = 'http://feeds2.feedburner.com/AllJupiterBroadcastingShowsOgg'
   open(url) do |rss|
     feed = RSS::Parser.parse(rss)
     lastitem=item
     item=feed.items[0].title
     if lastitem=!item
        puts item
     end
  end
end
