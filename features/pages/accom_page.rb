module Pages
  class Accom < Pages::Base
    path '/packages/new'

    def initialize
      @path_regex = /packages\/(.*)$/
    end

    def accom_container
      find('.accomHotelContainer')
    end

    def price_ticket
      find('#priceTicket')
    end

    def location_label
      find('.accomHotelContainer p.breadcrumb')
    end

    def total_amount
      all('.totalAmount').last
    end

    def book_now
      find('#bookNow.bookNowButton').click
    end

  end
end