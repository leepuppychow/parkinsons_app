require './app/authentication_keys'

class FindDoctorController < ApplicationController
  include AuthenticationKeys
  before_action :specialties, :states, :current_user

  def index
    @doctors = Hash.new()
    # @doctors = []
    @specialty = ""
    @city = ""
    @state = ""
  end

  def doctor_name(practice)
    practice["practices"].first["name"]
  end

  def full_address(practice)
    practice["practices"].first["visit_address"]["street"] + " " +
    practice["practices"].first["visit_address"]["city"] + ", " +
    practice["practices"].first["visit_address"]["state"] + " " +
    practice["practices"].first["visit_address"]["zip"]
  end

  def phone_number(practice)
    practice["practices"].first["phones"].first["number"]
  end

  def insurances_accepted(practice)
    practice["practices"].first["insurance_uids"]
  end

  def city_formatted(city)
    city.strip.downcase.tr(" ", "-")
  end

  def create
    @city = city_formatted(params[:city])
    @state = params[:state].strip.downcase
    @specialty = params[:specialty].strip.downcase
    @doctors = Hash.new()
    # @doctors = []

    response = Faraday.get("https://api.betterdoctor.com/2016-03-01/doctors?specialty_uid=#{@specialty}&location=#{@state}-#{@city}&limit=20&user_key=#{BETTER_DOCTOR_KEY}")
    data = JSON.parse(response.body)

    if data["data"]
      data["data"].each do |practice|
        @doctors["#{doctor_name(practice)}"] = {
          :specialty => @specialty,
          :location => full_address(practice),
          :phone_number => phone_number(practice),
          :insurance => insurances_accepted(practice)
        }
      end

      # @doctors = data["data"].map do |practice|
      #   [doctor_name(practice),
      #   full_address(practice),
      #   phone_number(practice),
      #   insurances_accepted(practice)]
      # end.uniq
    end

    render :index
  end
end

# <% if @doctors != [] %>
#   <h2><%= @specialty.capitalize%>(s) in: <%=@city.capitalize%>,  <%=@state.upcase%></h2>
#   <% @doctors.each do |doctor| %>
#     <section class="doctor-search">
#       <h4><%= doctor[0] %></h4>
#       <div><%= doctor[1] %></div>
#       <div><%= doctor[2] %></div></br>
#       <%= button_to "Add to My Care Team", patient_doctors_path(current_user),
#           params: {:find_doctor => doctor.push(@specialty)} %>
#       </br>
#       <div id="show-insurance">INSURANCE(S) ACCEPTED
#         <div id="insurance-info">
#           <% if doctor[3].empty? %>
#             Sorry, no insurance information found.
#           <% else %>
#             <% doctor[3].each do |insurance| %>
#               <li><%= insurance.capitalize %></li>
#             <% end %>
#           <% end %>
#         </div>
#       </div>
#     </section>
#   <% end %>
# <% end %>
