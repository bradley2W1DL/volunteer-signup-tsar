class AddTeamAffiliationColumnToSignup < ActiveRecord::Migration
  def change
    add_column :signups, :team_affiliation, :string
  end
end
