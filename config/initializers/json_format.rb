class ActiveSupport::TimeWithZone
    def as_json(options = {})
        strftime('%a, %m/%d/%y %l:%M %p')
    end
end
