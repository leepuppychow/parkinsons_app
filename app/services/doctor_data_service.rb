class DoctorDataService

  def initialize(city, state, specialty)
    @city = city
    @state = state
    @specialty = specialty
  end

  def practices
    JSON.parse(response.body, symbolize_names: true)[:data].map do |practice|
      Practice.new(practice[:practices])
    end
  end

  def response
    Faraday.get("https://api.betterdoctor.com/2016-03-01/doctors?specialty_uid=#{specialty}&location=#{state}-#{city}&limit=20&user_key=#{ENV["BETTER_DOCTOR_KEY"]}")
  end

  private
    attr_reader :city, :state, :specialty

end
