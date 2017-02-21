module ParibuPrice
  class Ticker
    require 'paribu_price/functions'
    require 'httparty'
    require 'json'

    @response = nil
    @sell = nil

    def self.buy_price
      day_stats['lst']
    end

    def self.sell_price
      @sell ||= ParibuPrice::Functions.sort_by_price(sell_orders).first['p']
      @sell.to_f
    end

    def self.volume
      day_stats['sum']
    end

    def self.average_price
      day_stats['avg']
    end

    def self.weighted_average_price
      nil
    end

    def self.highest
      day_stats['max']
    end

    def self.lowest
      day_stats['min']
    end

    def self.refresh
      @response = nil
      @sell = nil
      response
      true
    end

    def self.response
      @response ||= JSON.parse(HTTParty.get(API_URL).body)
    end

    def self.day_stats
      response['publicState']['market_sum']['day_stats']
    end

    def self.orders
      response['publicState']['orders']
    end

    def self.sell_orders
      orders['active']['btc_tl']['sell']
    end
  end
end
