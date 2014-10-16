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
    home_page.search_destination('rome italy')
    expect { home_page.destinations.size }.to greater_than(0)
    expect { (home_page.destinations[0].text == 'Rome, Italy') || (home_page.destinations[0].text == 'Any Destination') }.to become_true
    home_page.set_destination('Rome, Italy')
    home_page.search_origin('any')
    expect { home_page.origins.size }.to greater_than(0)
    expect { (home_page.origins[0].text == 'Any Airport') || (home_page.origins[0].text == 'Any South East') }.to become_true
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
    home_page.select_date('24')

    home_page.search
  end

  step 'I should get Multicom packages in search results' do
    search_results_page = Pages::SRP.new
    expect { search_results_page.current_page? }.to become_true
    expect { search_results_page.search_results.size > 0 }.to turn_true
    expect { search_results_page.total_results_count }.to greater_than(0)
    expect { search_results_page.destination }.to become('Rome, Italy')
    expect { search_results_page.origin }.to become('Any London')
    expect { search_results_page.date_of_journey }.to become('24-Nov-2014')
    expect { search_results_page.duration }.to become('7 Nights')
    expect { search_results_page.pax_room1 }.to become_true
    expect { search_results_page.pax_room1.text }.to become('Room 1: 1 Adult, 1 Child')
    expect { search_results_page.pax_room2.text }.to become('Room 2: 2 Adults, 1 Child, 1 Infant')
    expect { search_results_page.edit_button.present? }.to become_true

    search_results_page.edit_button.click
    expect { search_results_page.destination_editable }.to become('Rome, Italy')
    expect { search_results_page.origin_editable }.to become('Any London')
    search_results_page.search_button.click
  end

  step 'I select first Multicom package' do
    search_results_page = Pages::SRP.new
    expect { search_results_page.current_page? }.to become_true
    expect { search_results_page.dest_locations.size }.to greater_than(0)
    expect { search_results_page.packages_amount.size }.to greater_than(0)
    expect { search_results_page.search_results.size > 0 }.to turn_true

    expect { search_results_page.dest_locations[0].present? }.to become_true
    expect { search_results_page.packages_amount[0].present? }.to become_true
    @srp_location = search_results_page.dest_location
    @srp_amount   = search_results_page.total_amount

    search_results_page.detail_button.click
  end

  step 'I should get the details of the package' do
    accom_page = Pages::Accom.new
    expect { accom_page.current_page? }.to become_true
    expect { accom_page.accom_container.present? }.to turn_true
    expect { accom_page.location_label.text }.to become(@srp_location)
    # expect{ accom_page.total_amount.text }.to include_text(@srp_amount)
  end

  step 'I go for the booking of selected package' do
    accom_page = Pages::Accom.new
    expect { accom_page.current_page? }.to become_true
    accom_page.book_now
  end

  step 'I select the extras which I want to be included in my package' do
    cust_page = Pages::Customize.new
    expect { cust_page.current_page? }.to turn_true
    expect { cust_page.page_header.text }.to include_text('Holiday essentials')
    expect { cust_page.price_section.size }.to become(2)
    expect { cust_page.total_amount != '' }.to become_true
    @cust_amount_before_extra = cust_page.total_amount
    expect { cust_page.location_label }.to become(@srp_location)

    cust_page.select_luggage_extra
    @extra_luggage_label  = cust_page.luggage_extra_label
    @extra_luggage_amount = cust_page.luggage_extra_amount
    @cust_amount = cust_page.total_amount

    expect { @cust_amount.delete('^0-9.').to_f }.to become(@cust_amount_before_extra.delete('^0-9.').to_f + @extra_luggage_amount.delete('^0-9.').to_f)
    expect { @extra_luggage_label }.to become('Add luggage allowance')
    expect { cust_page.extras_in_price.text }.to include_text('Luggage allowance')

    cust_page.make_extras_selection
  end

  step 'I enter details of all the passengers' do
    pax_page = Pages::Pax.new
    expect { pax_page.current_page? }.to turn_true
    expect { pax_page.title.visible? }.to become_true
    expect { pax_page.enter_address_manually_link.visible? }.to become_true
    expect { !pax_page.find('.loading-wrapper img').visible? }.to become_true
    @pax_amount = pax_page.total_amount
    # expect { @pax_amount }.to include_text(@cust_amount)
    pax_page.set_title('Mr')
    pax_page.set_first_name('Test')
    pax_page.set_last_name('Test')
    pax_page.set_email('test@test.com')
    pax_page.set_confirm_email('test@test.com')
    pax_page.set_postcode('PE3 8SB')

    pax_page.enter_address_manually_link.click

    pax_page.set_house_number('Test')
    pax_page.set_street('Test')
    pax_page.set_city('Test')
    pax_page.set_country('United Kingdom')

    pax_page.set_date('10')
    pax_page.set_month('April')
    pax_page.set_year('1996')
    pax_page.set_contact_number('7989898342')

    pax_page.submit_lead_details

    pax_page.set_title2_room1('Master')
    pax_page.set_first_name2_room1('Test')
    pax_page.set_last_name2_room1('Test')
    pax_page.set_date2_room1('12')
    pax_page.set_month2_room1('August')
    pax_page.set_year2_room1('2003')

    pax_page.set_title3_room2('Mr')
    pax_page.set_first_name3_room2('Test')
    pax_page.set_last_name3_room2('Test')
    pax_page.set_date3_room2('12')
    pax_page.set_month3_room2('August')
    pax_page.set_year3_room2('1992')

    pax_page.set_title4_room2('Mr')
    pax_page.set_first_name4_room2('Test')
    pax_page.set_last_name4_room2('Test')
    pax_page.set_date4_room2('12')
    pax_page.set_month4_room2('August')
    pax_page.set_year4_room2('1992')

    pax_page.set_title5_room2('Miss')
    pax_page.set_first_name5_room2('Test')
    pax_page.set_last_name5_room2('Test')
    pax_page.set_date5_room2('12')
    pax_page.set_month5_room2('March')
    pax_page.set_year5_room2('2014')

    pax_page.set_title6_room2('Master')
    pax_page.set_first_name6_room2('Test')
    pax_page.set_last_name6_room2('Test')
    pax_page.set_date6_room2('12')
    pax_page.set_month6_room2('March')
    pax_page.set_year6_room2('2003')

    pax_page.submit_pax
  end

  step 'I enter card details to make payment' do
    pay_page = Pages::Pay.new
    expect { pay_page.current_page? }.to become_true
    expect { pay_page.price_section.size }.to become(2)
    expect { pay_page.total_amount }.to include_text(@pax_amount)
    expect { pay_page.first_passenger_name }.to become('Mr Test Test')
    expect { pay_page.first_passenger_dob }.to become('10 April 1996')
    expect { pay_page.second_passenger_name }.to become('Mr Test Test')
    expect { pay_page.second_passenger_dob }.to become('12 August 2003')
    expect { pay_page.first_passenger_room2_name }.to become('Mr Test Test')
    expect { pay_page.first_passenger_room2_dob }.to become('12 August 1992')
    expect { pay_page.second_passenger_room2_name }.to become('Mr Test Test')
    expect { pay_page.second_passenger_room2_dob }.to become('12 August 1992')
    expect { pay_page.third_passenger_room2_name }.to become('Miss Test Test')
    expect { pay_page.third_passenger_room2_dob }.to become('12 March 2014')
    expect { pay_page.forth_passenger_room2_name }.to become('Mr Test Test')
    expect { pay_page.forth_passenger_room2_dob }.to become('12 March 2003')

    pay_page.set_card_type('Visa Credit')
    pay_page.set_card_number('4444333322221111')
    pay_page.set_card_expiry_month('Sept')
    pay_page.set_card_expiry_year('2019')
    pay_page.set_card_holder_name('Mr. TEST TEST')
    pay_page.set_card_security_number('123')
  end

  step 'I make the payment after accepting terms and conditions' do
    pay_page = Pages::Pay.new
    expect { pay_page.current_page? }.to become_true
    pay_page.accept_t_and_c
    # pay_page.submit_card_details
  end

  step 'My Package should get booked successfully' do
    conf_page = Pages::Conf.new
    # expect { conf_page.current_page? }.to become_true
    # expect{ conf_page.header_text }.to become('Congratulations! Your Booking is complete!')
  end
end
