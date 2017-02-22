require "spec_helper"

describe ParibuPrice do
  it "has a version number" do
    expect(ParibuPrice::VERSION).not_to be nil
  end

  it 'has API_URL equals to https://www.paribu.com/endpoint/state' do
    expect(ParibuPrice::API_URL).to eq('https://www.paribu.com/endpoint/state')
  end

  it 'has PRICE_UNIT equals to TRY' do
    expect(ParibuPrice::PRICE_UNIT).to eq('TRY')
  end

  describe '.buy_price' do
    it 'calls ParibuPrice::Ticker.buy_price' do
      expect(ParibuPrice::Ticker).to receive(:buy_price)
      ParibuPrice.buy_price
    end
  end

  describe '.sell_price' do
    it 'calls ParibuPrice::Ticker.sell_price' do
      expect(ParibuPrice::Ticker).to receive(:sell_price)
      ParibuPrice.sell_price
    end
  end
end
