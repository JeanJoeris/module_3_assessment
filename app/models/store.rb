class Store
  def initialize(data)
    @data = data
  end

  def id
    data[:storeId]
  end

  def name
    data[:name]
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

  def hours
    data[:hoursAmPm].split(";")
  end

  def full_address
    "#{data[:address]} #{data[:address2]}, #{data[:city]}, #{data[:region]} #{data[:postalCode]}"
  end

  private
    attr_reader :data
end
