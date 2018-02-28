class Permission

  attr_reader :user, :controller, :action

  def initialize(user = nil, controller, action)
    @user = user || User.new()
    @controller = controller
    @action = action
  end

  def authorized?
    return true if controller == "welcome" && action.in?(%w(index))
    return true if controller == "session" && action.in?(%w(create destroy create_from_google))
    return true if controller == "users" && action.in?(%w(new create update))
    if user.is_doctor?
      return doctor_permissions
    elsif user.is_patient?
      return patient_permissions
    elsif user.is_admin?
      return admin_permissions
    end
  end

  private

    def doctor_permissions
      return true if controller == "welcome" && action.in?(%w(index))
      return true if controller == "session" && action.in?(%w(create destroy create_from_google))
      return true if controller == "users" && action.in?(%w(new create update))
      return true if controller == "api/v1/doctors" && action.in?(%w(index))
      return true if controller == "provider/messages" && action.in?(%w(new create))
      return true if controller == "provider/appointments" && action.in?(%w(index new create edit update destroy))
      return true if controller == "provider/patients" && action.in?(%w(index))
      return true if controller == "provider/tools" && action.in?(%w(index))
      return true if controller == "provider/articles" && action.in?(%w(index create))
      return true if controller == "doctors" && action.in?(%w(show))
    end

    def patient_permissions
      return true if controller == "activities" && action.in?(%w(index))
      return true if controller == "api/v1/doctors" && action.in?(%w(index))
      return true if controller == "users" && action.in?(%w(new create update))
      return true if controller == "appointments" && action.in?(%w(index destroy))
      return true if controller == "note" && action.in?(%w(update))
      return true if controller == "medications" && action.in?(%w(index new create show edit update destroy))
      return true if controller == "doctors" && action.in?(%w(index new create edit update destroy))
      return true if controller == "messages" && action.in?(%w(new create))
      return true if controller == "patients/doctors" && action.in?(%w(create))
      return true if controller == "activities" && action.in?(%w(index new create edit update show destroy))
      return true if controller == "exercises" && action.in?(%w(index))
      return true if controller == "articles" && action.in?(%w(index create))
      return true if controller == "find_doctor" && action.in?(%w(index create))
      return true if controller == "patients" && action.in?(%w(new create show))
    end

    def admin_permissions
      return true if controller == "admin/welcome" && action.in?(%w(index))
      return true if controller == "admin/patients" && action.in?(%w(index))
      return true if controller == "admin/doctors" && action.in?(%w(index))
      return true if controller == "admin/medications" && action.in?(%w(index))
      return true if controller == "admin/exercises" && action.in?(%w(index show new create edit update destroy))
      return true if controller == "admin/note" && action.in?(%w(index))
    end

end
