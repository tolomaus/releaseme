if $settings.email_enabled
  ActionMailer::Base.smtp_settings = {
      address: $settings.smtp_server,
      port: $settings.smtp_port,
      domain: $settings.domain,
      authentication: "plain",
      enable_starttls_auto: true,
      user_name: $settings.smtp_username,
      password: $settings.smtp_password
  }

  ActionMailer::Base.default_url_options[:host] = $settings.domain
  ActionMailer::Base.perform_deliveries = true
end
