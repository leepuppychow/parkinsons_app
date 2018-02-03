class Practice
  def initialize(info)
    @info = info.first
  end

  def name
    @info[:name]
  end

  def phone
    @info[:phones].first[:number]
  end

  def location
    @info[:visit_address][:street] + " " +
    @info[:visit_address][:city] + ", " +
    @info[:visit_address][:state] + " " +
    @info[:visit_address][:zip]
  end

  def insurances
    @info[:insurance_uids]
  end

end
