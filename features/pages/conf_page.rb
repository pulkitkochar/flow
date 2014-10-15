module Pages
  class Conf < Pages::Base
    path '/confirmation'

    def initialize
      @path_regex = /confirmation(.*)$/
    end

    def header_text
      find('h1.process-header').text
    end

  end
end