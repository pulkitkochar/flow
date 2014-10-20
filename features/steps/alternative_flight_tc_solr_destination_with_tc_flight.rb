class Spinach::Features::AlternativeFlightTcSolrDestinationWithTcFlight < Spinach::FeatureSteps
  include WaitSteps
  require 'pry'

  step 'I am on home page' do
    home_page = Pages::Home.new
    Pages::Home.visit
    page.driver.browser.manage.window.maximize
    expect { home_page.current_page? }.to become_true
  end

  step 'I search for the desired package' do
    pending 'step not implemented'
  end

  step 'I should get Solr packages in search results' do
    pending 'step not implemented'
  end

  step 'I select first Solr package' do
    pending 'step not implemented'
  end

  step 'I should get the details of the package' do
    pending 'step not implemented'
  end

  step 'I select alternate flight available' do
    pending 'step not implemented'
  end

  step 'I go for the booking of selected package' do
    pending 'step not implemented'
  end

  step 'I select the extras which I want to be included in my package' do
    pending 'step not implemented'
  end

  step 'I enter details of all the passengers' do
    pending 'step not implemented'
  end

  step 'I enter card details to make payment' do
    pending 'step not implemented'
  end

  step 'I make the payment after accepting terms and conditions' do
    pending 'step not implemented'
  end

  step 'My Package should get booked successfully' do
    pending 'step not implemented'
  end
end
