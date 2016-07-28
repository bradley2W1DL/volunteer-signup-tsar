class Spreadsheet
  def self.volunteer_spreadsheet
    package = Axlsx::Package.new
    wb = package.workbook

    Shift.all.each do |shift|
      wb.add_worksheet(name: shift.name) do |sheet|
        sheet.add_row %w{name email phone_number team_affiliation signup_id}
        shift.signups.each do |signup|
          sheet.add_row [signup.name, signup.email, signup.phone_number, signup.team_affiliation, signup.id]
        end
      end
    end
    ###
    ##
    package
  end
end
