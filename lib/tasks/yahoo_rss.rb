require 'rss'
require 'logger'

class Tasks::YahooRss
  def self.pickup_reader
    rss_source = "https://news.yahoo.co.jp/pickup/rss.xml"
    log = Logger.new("log/yahoo_rss.log")
    log.level = Logger::INFO

    begin
      rss = RSS::Parser.parse(rss_source, true)
    rescue RSS::Error
    end
    pub_date_max_time = Topic.order(pub_date: "DESC").pluck(:pub_date).first
    max_time = pub_date_max_time.present? ? pub_date_max_time : Time.now.yesterday
    rss.items.each do |item|
      if max_time < item.pubDate.to_datetime
        topic = Topic.new
        topic.title = item.title
        topic.link = item.link
        topic.pub_date = item.pubDate.to_datetime
        topic.save
        log.info("YahooRss.pickup_reader : title[#{topic.title}]")
      end
    end
  end
end