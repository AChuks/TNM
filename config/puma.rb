if ENV.fetch("RAILS_ENV") == 'production'
    bind "unix:///var/run/puma/my_app.sock"
    pidfile "/var/run/puma/my_app.sock"
end
workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }

on_worker_boot do
    # Valid on Rails up to 4.1 the initializer method of setting `pool` size
    ActiveSupport.on_load(:active_record) do
      config = ActiveRecord::Base.configurations[Rails.env] ||
                  Rails.application.config.database_configuration[Rails.env]
      config['pool'] = ENV['RAILS_MAX_THREADS'] || 5
      ActiveRecord::Base.establish_connection(config)
    end
end

plugin :tmp_restart