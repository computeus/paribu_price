module ParibuPrice
  module Functions
    def self.sort_by_price(hash_array)
      hash_array.sort_by { |x| x['p'] }
    end
  end
end
