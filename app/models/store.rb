class Store
  def initialize(data)
    @data = data
  end

  def id
    data[:storeId]
  end

  def long_name
    data[:longName]
  end

  def phone
    data[:phone]
  end

  def type
    data[:storeType]
  end

  def distance
    data[:distance]
  end

  def city
    data[:city]
  end

  private
    attr_reader :data
end
