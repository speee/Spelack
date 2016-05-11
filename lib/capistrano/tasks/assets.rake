namespace :assets do
  task :precompile do
    on roles(:app) do
      execute :bundle, :exec, :rake, 'assets:precompile'
    end
  end
end
