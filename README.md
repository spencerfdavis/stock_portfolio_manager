# Portfolio Management Deployment #

## Instructions ##

Make sure you have Ruby 1.9.2 and Bundler installed.  To deploy:

```bash
$ git clone https://github.com/spencerfdavis/stock_portfolio_manager.git
$ cd stock_portfolio_manager
$ bundle install
````
Setup database username/password in config/database.yml

$ rake db:setup RAILS_ENV=production
