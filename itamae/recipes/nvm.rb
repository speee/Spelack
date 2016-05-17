NVM_DIR = '/home/spelack-dev/.nvm/'.freeze
NVM_SCRIPT = '/home/spelack-dev/.nvm/nvm.sh'.freeze

git NVM_DIR do
  repository 'git://github.com/creationix/nvm.git'
end

execute "install node v5.10.1" do
  command "source #{NVM_SCRIPT}; nvm install 5.10.1"
end

execute "set global node v5.10.1" do
  command "source #{NVM_SCRIPT}; nvm alias default 5.10.1"
  not_if "source #{NVM_SCRIPT}; nvm alias default | grep v5.10.1"
end
