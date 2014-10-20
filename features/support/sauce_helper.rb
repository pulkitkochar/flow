# You should edit this file with the browsers you wish to use
# For options, check out http://saucelabs.com/docs/platforms
require "sauce"
require "sauce/capybara"
Sauce.config do |config|
  config[:browsers] = [
      # ["Windows 8", "Internet Explorer", "10"]
      # ["Windows 7", "Firefox", "33"],
      # ["Windows 8", "Chrome", "38"],
      # ['iPhone iOS 7.1','safari','7.1']
      ["OS X 10.8", "Safari", "6"]
  ]
end
