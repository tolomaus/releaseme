$settings=Setting.first

unless $settings
  # required for rspec where no seeding is done
  $settings = Setting.new
  $settings.email_address = "example@example.com"
  $settings.domain = "localhost:3000"
end

