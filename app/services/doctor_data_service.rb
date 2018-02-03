class DoctorDataService

  def initialize(city, state, specialty)
    @city = city
    @state = state
    @specialty = specialty
  end

  def practices
    response = Faraday.get("https://api.betterdoctor.com/2016-03-01/doctors?specialty_uid=#{@specialty}&location=#{@state}-#{@city}&limit=20&user_key=#{ENV["BETTER_DOCTOR_KEY"]}")
    data = JSON.parse(response.body)
  end


end
