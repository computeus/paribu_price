require "paribu_price/version"

module ParibuPrice
  API_URL = 'https://www.paribu.com/endpoint/state'
  PRICE_UNIT = 'TRY'

  def self.buy_price
    Ticker.buy_price
  end

  def self.sell_price
    Ticker.sell_price
  end
end

require 'paribu_price/ticker'
require 'paribu_price/orderbook'
