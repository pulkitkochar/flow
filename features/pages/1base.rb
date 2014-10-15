module Pages
  class Base < CapybaraPageObject::Page
    require 'pry'

    def current_page?
      /\S*/.match(source.current_url).to_s.scan(@path_regex).first
    end

    def wait_for_ajax
      Timeout.timeout(Capybara.default_wait_time) do
        active = source.evaluate_script('jQuery.active')
        until active == 0
          active = source.evaluate_script('jQuery.active')
        end
      end
    end

  end
end