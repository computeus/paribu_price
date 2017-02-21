module ParibuPrice
  module Functions
    def self.sort_by_price(hash)
      hash.sort_by { |x| x['p'] }
    end
  end
end
