Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://ey-utility-redis:6379/0' }
end
