# Portfolio Management Deployment #

## Instructions ##

Make sure you have Ruby 1.9.2, RubyGems and Bundler installed.  To deploy:

```bash
$ git clone https://github.com/spencerfdavis/stock_portfolio_manager.git
$ cd stock_portfolio_manager
$ bundle install
````
Configure your MySQL database username/password/host in config/database.yml for all environments.

```bash
$ rake db:setup RAILS_ENV=production
````