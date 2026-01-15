require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Reload code on every request = good foe developmett
  config.enable_reloading = true
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true

  # Caching
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{2.days.to_i}" }
  else
    config.action_controller.perform_caching = false
  end
  config.cache_store = :memory_store

  # Store uploaded files locally
  config.active_storage.service = :local

  # Action Mailer (Letter Opener)
  # config.action_mailer.delivery_method = :letter_opener
  # config.action_mailer.perform_deliveries = true
  # config.action_mailer.default_url_options = { host: "localhost", port: 3000 }
  # config.action_mailer.raise_delivery_errors = false
  # config.action_mailer.perform_caching = false
config.action_mailer.delivery_method = :smtp
config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true

config.action_mailer.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  user_name: ENV["GMAIL_USERNAME"],
  password: ENV["GMAIL_APP_PASSWORD"],
  authentication: "plain",
  enable_starttls_auto: true
}

config.action_mailer.default_url_options = { host: "localhost", port: 3000 }


  # Logging
  config.active_support.deprecation = :log
  config.active_record.verbose_query_logs = true
  config.active_record.query_log_tags_enabled = true
  config.active_job.verbose_enqueue_logs = true
  config.action_dispatch.verbose_redirect_logs = true
  config.assets.quiet = true

  # Raise an error on page load if migrations are pending
  config.active_record.migration_error = :page_load

  # Annotate rendered views with file names
  config.action_view.annotate_rendered_view_with_filenames = true

  # Raise error if before_action references missing actions
  config.action_controller.raise_on_missing_callback_actions = true
end
