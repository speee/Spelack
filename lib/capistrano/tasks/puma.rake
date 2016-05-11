namespace :puma do
  task :websocket do
    on roles(:app) do
      execute :bundle, :exec, :puma, '-p 28080 cable/config.ru'
    end
  end
end
