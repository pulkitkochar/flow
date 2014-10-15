module Pages
  class Home < Pages::Base
    path '/'

    def initialize
      @path_regex = //
    end

    def start_date
      find('#when')
    end

    def search
      find('#searchBtn').click
    end

    def search_destination(destination)
      find('#goingTo').set('')
      find('#goingTo').set(destination)
    end

    def destinations
      all('#destination .suggestions ul li')
    end

    def set_destination(destination)
      find('#destination .suggestions ul li', text: destination).click
    end

    def search_origin(origin)
      find('#origin').set('')
      find('#origin').set(origin)
    end

    def origins
      all('#airport .suggestions ul li')
    end

    def set_origin(origin)
      find('#airport .suggestions ul li', text: origin).click
    end

    def set_no_of_adults(number)
      all('.roomContainer')[0].find('#adults option', text: number).click
    end

    def set_no_of_children(number)
      all('.roomContainer')[0].find('#children0 option', text: number).click
    end

    def set_no_of_adults_in_2nd_room(number)
      all('.roomContainer')[1].find('#adults option', text: number).click
    end

    def set_no_of_children_in_2nd_room(number)
      all('.roomContainer')[1].find('#children1 option', text: number).click
    end

    def add_room
      find('#addAnotherRoomMd').click
    end

    def remove_room
      find('#removeRoom').click
    end

    def set_children
      find('#applyBtn').click
    end

    def set_first_child_age(age)
      all('.suggestions.children ul li:nth-child(1) select option')[age].click
    end

    def set_second_child_age(age)
      all('.suggestions.children ul li:nth-child(2) select option')[age].click
    end

    def set_third_child_age(age)
      all('.suggestions.children ul li:nth-child(3) select option')[age].click
    end

    def set_first_child_age_2nd_room(age)
      all('.suggestions.children ul li:nth-child(1) select option')[age].click
    end

    def set_second_child_age_2nd_room(age)
      all('.suggestions.children ul li:nth-child(2) select option')[age].click
    end

    def select_month(month)
      find('.ui-datepicker-month option',text: month).click
    end

    def select_year(year)
      find('.ui-datepicker-year option',text: year).click
    end

    def select_date(date)
      find('.ui-datepicker-calendar .ui-state-default',text: date).click
    end

  end
end