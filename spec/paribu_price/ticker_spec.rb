require "spec_helper"

describe ParibuPrice::Ticker do
  context 'methods' do
    before do
      expect(HTTParty).to receive(:get).and_return(double('Response', success?: true, body: { "publicState": { "orders": { "active": { "btc_tl": { "sell": [{ "a": 2.66, "p": 4301.33 }, { "a": 0.266, "p": 4756.59 }], "buy": [{ "a": 0.899, "p": 3142.57 }, { "a": 0.138, "p": 3036.64 }, { "a": 0.138, "p": 3037.64 }] } } }, "market_sum": { "day_stats": { "fst": 4100, "lst": 4150, "chg": 50, "chp": 1.22, "sum": 140.34, "avg": 4106.63, "min": 3980.01, "max": 4192.54, "cnt": 231 } } } }.to_json))
      ParibuPrice::Ticker.refresh
    end

    describe '.buy_price' do
      it 'should return the current buy price' do
        expect(ParibuPrice::Ticker.buy_price).to eq(4150)
      end
    end

    describe '.sell_price' do
      it 'should return the current sell price' do
        expect(ParibuPrice::Ticker.sell_price).to eq(4301.33)
      end
    end

    describe '.volume' do
      it 'should return the current volume data' do
        expect(ParibuPrice::Ticker.volume).to eq(140.34)
      end
    end

    describe '.average_price' do
      it 'should return the current average price data' do
        expect(ParibuPrice::Ticker.average_price).to eq(4106.63)
      end
    end

    describe '.weighted_average_price' do
      it 'should return nil' do
        expect(ParibuPrice::Ticker.weighted_average_price).to eq(nil)
      end
    end

    describe '.highest' do
      it 'should return the current highest price data' do
        expect(ParibuPrice::Ticker.highest).to eq(4192.54)
      end
    end

    describe '.lowest' do
      it 'should return the current lowest price data' do
        expect(ParibuPrice::Ticker.lowest).to eq(3980.01)
      end
    end
  end
end
