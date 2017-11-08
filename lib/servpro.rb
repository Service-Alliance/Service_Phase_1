module ServPro
  class Utils
    def self.seconds_to_hours(seconds)
      hours, minutes, seconds =
        [1.hour, 1.minute, 1.second].inject([]) do |acc, unit|
          quotient, seconds = seconds.divmod unit
          acc << quotient
        end

      "#{hours}:#{minutes}:#{seconds}"
    end
  end
end
