module Pages
  class Pay < Pages::Base
    path '/pay'

    def initialize
      @path_regex = /pay(.*)$/
    end

    def total_amount
      all('.price.price-footer').first.text
    end

    def price_section
      all('.totalPriceFrom')
    end

    def standard_payment_option
      find('.stdDeposit input')
    end

    def low_payment_option
      find('.lowDeposit input')
    end

    def first_passenger_name
      find('#occupant_0').text
    end

    def first_passenger_dob
      find('#birthDate_0').text
    end

    def second_passenger_name
      find('#occupant_1').text
    end

    def second_passenger_dob
      find('#birthDate_1').text
    end

    def third_passenger_name
      find('#occupant_2').text
    end

    def third_passenger_dob
      find('#birthDate_2').text
    end

    def forth_passenger_name
      find('#occupant_3').text
    end

    def forth_passenger_dob
      find('#birthDate_3').text
    end

    def set_card_type(card)
      find('#cardType option', text: card).click
    end

    def set_card_number(number)
      find('#cardNumber').set(number)
    end

    def set_card_expiry_month(month)
      find('#expiration-month option', text: month).click
    end

    def set_card_expiry_year(year)
      find('#expiration-year option', text: year).click
    end

    def set_card_holder_name(name)
      find('#cardName').set(name)
    end

    def set_card_security_number(number)
      find('#securityNumber').set(number)
    end

    def accept_t_and_c
      find('.pymtDetailsContainer input').click
    end

    def submit_card_details
      find('#submit-card-details').click
    end

  end
end