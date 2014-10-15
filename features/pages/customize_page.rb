module Pages
  class Customize < Pages::Base
    path '/customize'

    def initialize
      @path_regex = /customize(.*)$/
    end
    
    def page_header
     find('.extras-pageHeader') 
    end
    
    def make_extras_selection
      find('#submit-extras').click
    end
    
    def price_section
      all('.totalPriceFrom')
    end
    
    def location_label
      find('#geoPath').text
    end
    
    def extras_in_price
      all('.costingItems').last
    end

    def select_3for2_extra
      find(".extra .extra-OFFER input[type='checkbox']").click
    end

    def bundled_3for2_label
      find('.extra .extra-OFFER .extras-titles').text
    end

    def bundled_3for2_amount
      find('.extra .extra-OFFER .extraPrice').text
    end

    def select_luggage_extra
      find(".extra .extra-BAGGAGE input[type='checkbox']").click
    end

    def luggage_extra_label
      find('.extra .extra-BAGGAGE .extras-titles').text
    end

    def luggage_extra_amount
      find('.extra .extra-BAGGAGE .extraPrice').text
    end

    def select_insurance_extra_2adult_1infant_1child(type)
      find('.extra-INSURANCE #insurance').click

      find('.extra-INSURANCE .dayEntry')[0].find('option',text: '10').click
      find('.extra-INSURANCE .monthEntry')[0].find('option',text: 'April').click
      find('.extra-INSURANCE .yearEntry')[0].find('option',text: '1996').click

      find('.extra-INSURANCE .dayEntry')[1].find('option',text: '1').click
      find('.extra-INSURANCE .monthEntry')[1].find('option',text: 'January').click
      find('.extra-INSURANCE .yearEntry')[1].find('option',text: '1991').click

      find('.extra-INSURANCE .dayEntry')[2].find('option',text: '2').click
      find('.extra-INSURANCE .monthEntry')[2].find('option',text: 'January').click
      find('.extra-INSURANCE .yearEntry')[2].find('option',text: '2014').click

      find('.extra-INSURANCE .dayEntry')[3].find('option',text: '2').click
      find('.extra-INSURANCE .monthEntry')[3].find('option',text: 'August').click
      find('.extra-INSURANCE .yearEntry')[3].find('option',text: '2005').click

      find('#getInsuranceQuote').click
      find('#' + type + '-radio').click

      find("#insurance-terms input[type='checkbox']").click

      @insurance_price = find('#' + type + '-quote').text
    end

    def insurance_extra_label
      find('.extra-INSURANCE .extras-titles').text
    end

    def total_amount
      all('.price.price-footer')[0].text
    end

  end
end