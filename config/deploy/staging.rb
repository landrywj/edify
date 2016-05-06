set :chruby_ruby, 'ruby-2.3.0'
server 'staging server', user: 'deployer', roles: %( web app db )
