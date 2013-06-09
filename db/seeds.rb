# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

puts 'Creating the roles (if necessary) ...'
["global_admin", "admin", "user"].each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end

if User.count == 0
  puts 'It is a new database'

  puts 'Creating the settings ...'
  settings = Setting.new
  settings.app_name = "ReleaseMe"
  unless Rails.env.production?
    settings.app_name += " [#{Rails.env}]"
  end
  settings.domain = Rails.env.production? ? "releaseme.be" : "localhost:3000"
  settings.email_enabled = false
  settings.email_address = "ReleaseMe <info@releaseme.be>"
  settings.save!
  # settings.smtp_username = "***" # set it via the GUI
  # settings.smtp_password = "***" # set it via the GUI
  # settings.smtp_server = "smtp.gmail.com"
  # settings.smtp_port = "587"

  puts 'Creating the organization ...'
  org = Organization.new
  org.name = "default"
  org.save!

  puts 'Creating the global admin ...'
  global_admin = User.new
  global_admin.name = "First user"
  global_admin.email = "example@example.com"
  global_admin.password = "changeme"
  global_admin.password_confirmation = global_admin.password
  global_admin.add_role(:global_admin)
  global_admin.add_role(:admin)

  global_admin.organization = org

  global_admin.skip_confirmation!
  global_admin.save!
end


