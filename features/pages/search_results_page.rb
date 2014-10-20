module Pages
  class SRP < Pages::Base
    path '/search'

    def initialize
      @path_regex = /search(.*)$/
    end

    def edit_button
      find('#editSearchResults')
    end

    def search_button
      find('#searchBtn')
    end

    def total_results
      find('.hidden-xs .holidaysFoundTitle #test-holiday-total')
    end

    def total_results_count
      total_results.text.delete('^0-9.').to_i
    end

    def search_results
      all('div[id^="package"]')
    end

    def detail_button
      search_results[0].find('.detailsBtn')
    end

    def package_types
      find(:xpath, "//div[@facet-title='Brand']")
    end

    def tc_packages
      find(:xpath, "//span[text()='Thomas Cook']/../input[@type='checkbox']")
    end

    def destination
      find('#destinationLabel').text
    end

    def origin
      find('#originLabel').text
    end

    def date_of_journey
      find('#whenLabel').text
    end

    def duration
      find('#durationLabel').text
    end

    def pax_room1
      find('.searchBarShadow',text: 'With ?').find(:xpath, '..').all('.searchBarLabel')[0]
    end

    def pax_room2
      find('.searchBarShadow',text: 'With ?').find(:xpath, '..').all('.searchBarLabel')[1]
    end

    def destination_editable
      find('#goingTo').value
    end

    def origin_editable
      find('#origin').value
    end

    def search_origin(origin)
      find('#origin').set('')
      find('#origin').set(origin)
    end

    def set_origin(origin)
      find('#airport .suggestions ul li', text: origin).click
    end

    def date_of_journey_editable
      find('#whenLabel').text
    end

    def dest_locations
      all('.locationLabel')
    end
    
    def dest_location
      dest_locations[0].text
    end

    def packages_amount
      all('.savingContainer .total-price')
    end

    def total_amount
      packages_amount[0].text
    end  
  end
end