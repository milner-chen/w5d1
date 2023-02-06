class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if num_buckets == count
      resize!
    end
    if !include?(key)
      @store[key.hash % num_buckets] << key.hash
      @count += 1
    end
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key.hash)
  end

  def remove(key)
    if include?(key)
      @store[key.hash % num_buckets].delete(key.hash)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    res = Array.new(num_buckets * 2) { Array.new }
    @store.flatten.each do |n|
      res[n % (num_buckets * 2)] << n
    end
    @store = res
  end
end
