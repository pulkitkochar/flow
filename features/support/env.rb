ENV['RAILS_ENV'] = 'test'
require './config/environment'

require 'rspec/rails'

ENV['allow_payment']= ENV['allow_payment'] || 'false'
# Capybara.app_host = "http://localhost:9000/"
# Capybara.app_host = "https://oneweb-qa.thomascook.com/"
Capybara.app_host   = "https://uk-staging.thomascook.io/"

Capybara.run_server = false

Dir["#{Rails.root}/features/pages/**/*.rb"].sort.each do |file|
  require file
end

require "#{Rails.root}/features/steps/wait_steps.rb"

Capybara.default_wait_time = 20


if (ENV['sauce'] != 'true')
  Spinach.hooks.before_run do
    case ENV['headless']
      when 'true'
        require 'capybara/poltergeist'
        Capybara.register_driver :poltergeist do |app|
          Capybara::Poltergeist::Driver.new(app, { js_errors: false, port: 44678+ENV['TEST_ENV_NUMBER'].to_i, phantomjs_options: ['--proxy-type=none'], timeout: 180 })
        end
        Capybara.default_driver = Capybara.javascript_driver = :poltergeist
      else
        case ENV['driver']
          when 'chrome'
            Capybara.register_driver :selenium do |app|
              Capybara::Selenium::Driver.new(app, :browser => :chrome)
            end
          when 'ie'
            Capybara.register_driver :selenium do |app|
              Capybara::Selenium::Driver.new(app,
                                             :browser => :internet_explorer)
              # :url => "http://192.168.1.127:4444/wd/hub",
              # :desired_capabilities => :internet_explorer)
            end
          else
            Capybara.default_driver = Capybara.javascript_driver = :selenium
        end
    end
  end
end


# require 'database_cleaner'
# DatabaseCleaner.strategy = :truncation
#
# Spinach.hooks.before_scenario{ DatabaseCleaner.clean }
#
# Spinach.config.save_and_open_page_on_failure = true
