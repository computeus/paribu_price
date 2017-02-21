module ParibuPrice
  class Orderbook
    require 'paribu_price/functions'
    require 'httparty'
    require 'json'

    @response = nil

    def self.asks
      ParibuPrice::Functions.sort_by_price(orders['sell'])
    end

    def self.bids
      ParibuPrice::Functions.sort_by_price(orders['buy'])
    end

    def self.refresh
      @response = nil
      response
      true
    end

    def self.response
      @response ||= JSON.parse(HTTParty.get(API_URL).body)
    end

    def self.orders
      response['publicState']['orders']['active']['btc_tl']
    end
  end
end
