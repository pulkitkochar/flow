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

    def std_deposit_amount
      find('.paymentTypeContainer .stdDeposit .price').text
    end

    def to_pay_today
      find('.paymentContainer.footer .text-right .price', visible: true).text
    end

    def low_payment_option
      find('.lowDeposit input')
    end

    def first_passenger_name
      all('#occupant_0')[0].text
    end

    def first_passenger_dob
      all('#birthDate_0')[0].text
    end

    def second_passenger_name
      all('#occupant_1')[0].text
    end

    def second_passenger_dob
      all('#birthDate_1')[0].text
    end

    def third_passenger_name
      all('#occupant_2')[0].text
    end

    def third_passenger_dob
      all('#birthDate_2')[0].text
    end

    def forth_passenger_name
      all('#occupant_3')[0].text
    end

    def forth_passenger_dob
      all('#birthDate_3')[0].text
    end

    def fifth_passenger_name
      all('#occupant_4')[0].text
    end

    def fifth_passenger_dob
      all('#birthDate_4')[0].text
    end

    def sixth_passenger_name
      all('#occupant_5')[0].text
    end

    def sixth_passenger_dob
      all('#birthDate_5')[0].text
    end

    def first_passenger_room2_name
      all('#occupant_0')[1].text
    end

    def first_passenger_room2_dob
      all('#birthDate_0')[1].text
    end

    def second_passenger_room2_name
      all('#occupant_1')[1].text
    end

    def second_passenger_room2_dob
      all('#birthDate_1')[1].text
    end

    def third_passenger_room2_name
      all('#occupant_2')[1].text
    end

    def third_passenger_room2_dob
      all('#birthDate_2')[1].text
    end

    def forth_passenger_room2_name
      all('#occupant_3')[1].text
    end

    def forth_passenger_room2_dob
      all('#birthDate_3')[1].text
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