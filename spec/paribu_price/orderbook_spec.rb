require "spec_helper"

describe ParibuPrice::Orderbook do
  context 'methods' do
    before do
      expect(HTTParty).to receive(:get).and_return(double('Response', success?: true, body: { "publicState": { "orders": { "active": { "btc_tl": { "sell": [{ "a": 2.66, "p": 4301.33 }, { "a": 0.266, "p": 4756.59 }], "buy": [{ "a": 0.899, "p": 3142.57 }, { "a": 0.138, "p": 3036.64 }, { "a": 0.138, "p": 3037.64 }] } } }, "market_sum": { "day_stats": { "fst": 4100, "lst": 4150, "chg": 50, "chp": 1.22, "sum": 140.34, "avg": 4106.63, "min": 3980.01, "max": 4192.54, "cnt": 231 } } } }.to_json))
      ParibuPrice::Orderbook.refresh
    end

    describe '.asks' do
      it 'should return the current buy price' do
        expect(ParibuPrice::Orderbook.asks.count).to eq(2)
      end
    end

    describe '.bids' do
      it 'should return the current sell price' do
        expect(ParibuPrice::Orderbook.bids.count).to eq(3)
      end
    end
  end
end
