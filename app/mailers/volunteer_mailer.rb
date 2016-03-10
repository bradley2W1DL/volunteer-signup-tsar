class VolunteerMailer < ApplicationMailer

  def edit_request_email(signup, request)
    @signup = signup
    @shift = Shift.find(signup.shift_id)
    @name = request[:name]
    @message = request[:message]
    mail(to: DEFAULT_RECIPIENTS, from: @signup.email, subject: "SBR Volunteer Tsar: #{signup.name} wants to change something")
  end
end
