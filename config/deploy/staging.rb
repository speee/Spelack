set :stage, :staging
set :rails_env, 'staging'
set :node_env, 'production'
server '52.68.200.37', user: 'spelack-dev', roles: %w(app web db)
set :ssh_options, keys: '~/.ssh/aws_rsa'
