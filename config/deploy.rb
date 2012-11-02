set :application, "portfolio_manager"
set :repository,  "git://github.com/spencerfdavis/stock_portfolio_manager.git"
set :scm, :git

# Change this to deployment server
server "127.0.0.1", :web, :app, :db, :primary => true