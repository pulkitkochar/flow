module Pages
  class Pax < Pages::Base
    path '/pax'

    def initialize
      @path_regex = /pax(.*)$/
    end

    def set_first_name(name)
      find('#name').set(name)
    end

    def set_last_name(name)
      find('#surname').set(name)
    end

    def set_email(email)
      keypress_script = "$('#email').focus().val('#{email}').keyup().blur();"
      source.execute_script(keypress_script)
    end

    def set_confirm_email(email)
      keypress_script = "$('#leadPassengerConfirmEmail').focus().val('#{email}').keyup().blur();"
      source.execute_script(keypress_script)
    end

    def set_postcode(code)
      find('#postCode').set(code)
    end

    def enter_address_manually_link
      find('#manual-address-entry')
    end

    def set_house_number(no)
      find('#houseNumber').set(no)
    end

    def set_street(street)
      find('#street').set(street)
    end

    def set_city(city)
      find('#city').set(city)
    end

    def set_contact_number(number)
      find('#contactNumber').set(number)
    end

    def submit_lead_details
      find('.submit-stage .btn.btn-success').click
    end

    def submit_pax
      find('#paxSubmit').click
    end

    def total_amount
      all('.price.price-footer').first.text
    end

    def title
      find('#title')
    end

    def set_title(title)
      all('#title option').each do |opt|
        if opt.text == title
          opt.click
        end
      end
    end

    def set_country(country)
      find('#country option', text: country).click
    end

    def set_date(day)
      find('#day option', text: day).click
    end

    def set_month(month)
      find('#month option', text: month).click
    end

    def set_year(year)
      find('#year option', text: year).click
    end

    def set_title2_room1(title)
      all('#title2Room1 option').each do |opt|
        if opt.text == title
          opt.click
        end
      end
    end

    def set_first_name2_room1(name)
      find('#name2Room1').set(name)
    end

    def set_last_name2_room1(name)
      find('#surname2Room1').set(name)
    end

    def set_date2_room1(day)
      find('#day2Room1 option', text: day).click
    end

    def set_month2_room1(month)
      find('#month2Room1 option', text: month).click
    end

    def set_year2_room1(year)
      find('#year2Room1 option', text: year).click
    end

    def set_title3_room1(title)
      all('#title3Room1 option').each do |opt|
        if opt.text == title
          opt.click
        end
      end
    end

    def set_first_name3_room1(name)
      find('#name3Room1').set(name)
    end

    def set_last_name3_room1(name)
      find('#surname3Room1').set(name)
    end

    def set_date3_room1(day)
      find('#day3Room1 option', text: day).click
    end

    def set_month3_room1(month)
      find('#month3Room1 option', text: month).click
    end

    def set_year3_room1(year)
      find('#year3Room1 option', text: year).click
    end

    def set_title3_room2(title)
      all('#title3Room2 option').each do |opt|
        if opt.text == title
          opt.click
        end
      end
    end

    def set_first_name3_room2(name)
      find('#name3Room2').set(name)
    end

    def set_last_name3_room2(name)
      find('#surname3Room2').set(name)
    end

    def set_date3_room2(day)
      find('#day3Room2 option', text: day).click
    end

    def set_month3_room2(month)
      find('#month3Room2 option', text: month).click
    end

    def set_year3_room2(year)
      find('#year3Room2 option', text: year).click
    end

    def set_title4_room2(title)
      all('#title4Room2 option').each do |opt|
        if opt.text == title
          opt.click
        end
      end
    end

    def set_first_name4_room2(name)
      find('#name4Room2').set(name)
    end

    def set_last_name4_room2(name)
      find('#surname4Room2').set(name)
    end

    def set_date4_room2(day)
      find('#day4Room2 option', text: day).click
    end

    def set_month4_room2(month)
      find('#month4Room2 option', text: month).click
    end

    def set_year4_room2(year)
      find('#year4Room2 option', text: year).click
    end

    def set_title5_room2(title)
      all('#title5Room2 option').each do |opt|
        if opt.text == title
          opt.click
        end
      end
    end

    def set_first_name5_room2(name)
      find('#name5Room2').set(name)
    end

    def set_last_name5_room2(name)
      find('#surname5Room2').set(name)
    end

    def set_date5_room2(day)
      find('#day5Room2 option', text: day).click
    end

    def set_month5_room2(month)
      find('#month5Room2 option', text: month).click
    end

    def set_year5_room2(year)
      find('#year5Room2 option', text: year).click
    end

    def set_title6_room2(title)
      all('#title6Room2 option').each do |opt|
        if opt.text == title
          opt.click
        end
      end
    end

    def set_first_name6_room2(name)
      find('#name6Room2').set(name)
    end

    def set_last_name6_room2(name)
      find('#surname6Room2').set(name)
    end

    def set_date6_room2(day)
      find('#day6Room2 option', text: day).click
    end

    def set_month6_room2(month)
      find('#month6Room2 option', text: month).click
    end

    def set_year6_room2(year)
      find('#year6Room2 option', text: year).click
    end

    def set_title4_room1(title)
      all('#title4Room1 option').each do |opt|
        if opt.text == title
          opt.click
        end
      end
    end

    def set_first_name4_room1(name)
      find('#name4Room1').set(name)
    end

    def set_last_name4_room1(name)
      find('#surname4Room1').set(name)
    end

    def set_date4_room1(day)
      find('#day4Room1 option', text: day).click
    end

    def set_month4_room1(month)
      find('#month4Room1 option', text: month).click
    end

    def set_year4_room1(year)
      find('#year4Room1 option', text: year).click
    end

  end
end