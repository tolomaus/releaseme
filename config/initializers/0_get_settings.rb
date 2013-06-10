

if ActiveRecord::Base.connection.tables.include?('settings')
  # there are no tables when the db schema is loaded for the first time with rake db:migrate
  $settings = Setting.first

  unless $settings
    # required for rspec where no seeding is done
    $settings = Setting.new
    $settings.email_address = "example@example.com"
    $settings.domain = "localhost:3000"
  end
else
  class Ghost
    def method_missing(m)
      ''
    end
  end
  $settings = Ghost.new
end


