class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    res = []
    self.each_with_index do |el, i|
      value_hash = el.hash
      index_hash = i.hash
      res << (value_hash + index_hash).hash
    end
    res.sum
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
