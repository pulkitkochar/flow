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
      find(".extra.extra-OFFER input[type='checkbox']", visible: true).click
    end

    def bundled_3for2_label
      find('.extra.extra-OFFER .extras-titles',).text
    end

    def bundled_3for2_amount
      find('.extra.extra-OFFER .extraPrice').text
    end

    def select_luggage_extra
      find(".extra.extra-BAGGAGE input[type='checkbox']", visible: true).click
    end

    def luggage_extra_label
      find('.extra.extra-BAGGAGE .extras-titles').text
    end

    def luggage_extra_amount
      all('.extra.extra-BAGGAGE .extraPrice').last.text
    end

    def select_insurance_extra_2adult_1infant_1child(type)
      find('.extra-INSURANCE #insurance').click

      all('.extra-INSURANCE .dayEntry')[0].find('option',text: '10').click
      all('.extra-INSURANCE .monthEntry')[0].find('option',text: 'April').click
      all('.extra-INSURANCE .yearEntry')[0].find('option',text: '1996').click

      all('.extra-INSURANCE .dayEntry')[2].find('option',text: '12').click
      all('.extra-INSURANCE .monthEntry')[2].find('option',text: 'January').click
      all('.extra-INSURANCE .yearEntry')[2].find('option',text: '2014').click
      all('.extra-INSURANCE .dayEntry')[1].find('option',text: '11').click
      all('.extra-INSURANCE .monthEntry')[1].find('option',text: 'January').click
      all('.extra-INSURANCE .yearEntry')[1].find('option',text: '1991').click


      all('.extra-INSURANCE .dayEntry')[3].find('option',text: '21').click
      all('.extra-INSURANCE .monthEntry')[3].find('option',text: 'August').click
      all('.extra-INSURANCE .yearEntry')[3].find('option',text: '2005').click
      find('#getInsuranceQuote').click
      find('#' + type + '-radio').click

      find("#insurance-terms input[type='checkbox']").click
    end

    def insurance_extra_label
      find('.extra-INSURANCE .extras-titles').text
    end

    def insurance_extra_amount(type)
      find('#' + type + '-quote').text
    end

    def total_amount
      all('.price.price-footer')[0].text
    end

    def m_total_amount
      all('.price.price-footer')[1].text
    end

  end
end