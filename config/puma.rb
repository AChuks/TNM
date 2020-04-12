bind "unix:///var/run/puma/my_app.sock"
pidfile "/var/run/puma/my_app.sock"
stdout_redirect "/var/log/puma.log", "/var/log/puma.log", true

threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

port        ENV['PORT']     || 3000
environment ENV['RAILS_ENV'] || 'development'
plugin :tmp_restart