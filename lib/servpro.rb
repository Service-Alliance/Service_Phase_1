module ServPro
  class Utils
    def self.seconds_to_hours(seconds)
      hours, minutes, secs =
        [1.hour, 1.minute, 1.second].inject([]) do |acc, unit|
          quotient, seconds = seconds.to_i.divmod unit
          acc << quotient
        end

      if secs.eql?(0)
        "#{hours}:#{'%02d' % minutes}"
      else
        "#{hours}:#{'%02d' % minutes}:#{'%02d' % secs}"
      end
    end
  end
end
