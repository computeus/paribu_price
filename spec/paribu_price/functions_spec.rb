require "spec_helper"

describe ParibuPrice::Ticker do
  context 'methods' do
    describe '.sort_by_price' do
      it 'should return the hash array ordered by p value' do
        hash = [{ a: 0.266, p: 2 }, { a: 2.66, p: 1 }]
        expect(ParibuPrice::Functions.sort_by_price(hash)).to eq([{ a: 0.266, p: 2 }, { a: 2.66, p: 1 }])
      end
    end
  end
end
