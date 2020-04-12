stdout_redirect "/var/log/puma.log", "/var/log/puma.log", true

threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RACK_ENV") { "development" }
plugin :tmp_restart