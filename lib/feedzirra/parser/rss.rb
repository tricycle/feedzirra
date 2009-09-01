module Feedzirra
  
  module Parser
    # == Summary
    # Parser for dealing with RSS feeds.
    #
    # == Attributes
    # * title
    # * feed_url
    # * url
    # * entries
    # * description
    class RSS
      include SAXMachine
      include FeedUtilities
      element :title
      element :link, :as => :url
      elements :item, :as => :entries, :class => RSSEntry
      element :description
      element :"itunes:new-feed-url", :as => :new_feed_url

      attr_accessor :feed_url

      def self.able_to_parse?(xml) #:nodoc:
        xml =~ /\<rss|rdf/
      end
    end

  end
  
end