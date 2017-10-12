module Servpro
  class Zipcode
    def self.regexp
      /(^\d{5}(?:[\s]?[-\s][\s]?\d{4})?$)/
    end

    def self.regexp_string
      '(^\d{5}(?:[\s]?[-\s][\s]?\d{4})?$)'
    end
  end
end
