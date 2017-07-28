# Date
# —————————-
#Date::DATE_FORMATS[:default] = “%Y-%m-%d” # 2013-11-03
DateTime::DATE_FORMATS[:default] = lambda { |time| time.strftime("%a, %m/%d/%y %l:%M %p") }
Time::DATE_FORMATS[:default] = lambda { |time| time.strftime("%a, %m/%d/%y %l:%M %p") }