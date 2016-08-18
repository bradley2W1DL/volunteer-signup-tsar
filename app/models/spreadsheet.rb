require 'csv'

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

  def self.team_volunteers
    package = Axlsx::Package.new
    wb = package.workbook
    team_roster = []
    CSV.foreach(Rails.root.join('lib/racer_roster.csv')) do |row|
      next if row[1] == 'First Name'
      first = row[1]
      last = row[2]
      team_roster << "#{first.try(:capitalize)} #{last.try(:capitalize)}"
    end
    team_roster.sort!

    wb.add_worksheet(name: 'volunteers') do |sheet|
      sheet.add_row %w{TEAM SHIFT NAME SBR_TEAM_MEMBERS}
      count = 0
      Signup.all.order('name ASC').each do |signup|
        sheet.add_row [signup.team_affiliation, signup.shift.name, signup.name, team_roster[count]]
        count += 1
      end
    end
    package
  end
end
