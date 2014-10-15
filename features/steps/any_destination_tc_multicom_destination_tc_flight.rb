class Spinach::Features::AnyDestinationTcMulticomDestinationTcFlight < Spinach::FeatureSteps
  include WaitSteps
  require 'pry'

  step 'I am on home page' do
    home_page = Pages::Home.new
    Pages::Home.visit
    page.driver.browser.manage.window.maximize
    expect { home_page.current_page? }.to become_true
  end

  step 'I search for the desired package' do
    home_page = Pages::Home.new
    expect { home_page.current_page? }.to become_true
    home_page.search_destination('new york')
    expect { home_page.destinations.size }.to greater_than(0)
    expect { (home_page.destinations[0].text == 'New York, USA') || (home_page.destinations[0].text == 'Any Destination') }.to become_true
    binding.pry
    home_page.set_destination('New York, USA')
    home_page.search_origin('any')
    expect { home_page.origins.size }.to greater_than(0)
    expect { home_page.origins[0].text }.to become('Any Airport')
    home_page.set_origin('Any London')

    home_page.set_no_of_adults('1')
    home_page.set_no_of_children('1')
    home_page.set_first_child_age(11)
    home_page.set_children
    home_page.add_room
    home_page.set_no_of_adults_in_2nd_room('2')
    home_page.set_no_of_children_in_2nd_room('2')
    home_page.set_first_child_age_2nd_room(1)
    home_page.set_second_child_age_2nd_room(11)
    home_page.set_children

    home_page.start_date.click
    home_page.start_date.click
    home_page.select_year('2014')
    home_page.select_month('Nov')
    home_page.select_date('21')

    home_page.search
  end

  step 'I should get Multicom packages in search results' do
    search_results_page = Pages::SRP.new
    expect { search_results_page.current_page? }.to become_true

    expect { search_results_page.total_results.size }.to greater_than(1)
    expect { search_results_page.total_results_count }.to greater_than(0)
    expect { search_results_page.destination }.to become('New York, USA')
    expect { search_results_page.origin }.to become('Any London')
    expect { search_results_page.date_of_journey }.to become('21-Nov-2014')
    expect { search_results_page.duration }.to become("I don't mind")
    expect { search_results_page.pax_room1 }.to become_true
    expect { search_results_page.pax_room1.text }.to become('Room 1: 1 Adult, 2 Children, 1 Infant')
    expect { search_results_page.pax_room2.text }.to become('Room 2: 2 Adults, 1 Child, 1 Infant')
    expect { search_results_page.edit_button.present? }.to become_true

    search_results_page.edit_button.click
    expect { search_results_page.destination_editable }.to become('New York, USA')
    expect { search_results_page.origin_editable }.to become('Any London')
    search_results_page.search_button.click
    # expect { search_results_page.package_types.text }.to include_text('Thomas Cook')
  end

  step 'I select first Multicom package' do
    pending 'step not implemented'
  end

  step 'I should get the details of the package' do
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
