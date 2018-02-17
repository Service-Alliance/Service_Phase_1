# Warn when there is a big PR
warn("Big PR -- consider splitting it up.") if git.lines_of_code > 500

# Don't let testing shortcuts get into master by accident
fail("fdescribe left in tests") if `grep -r fdescribe specs/ `.length > 1
fail("fit left in tests") if `grep -r fit specs/ `.length > 1

added_lines = github.pr_diff.split("\n").select{ |line| line =~ /^\+/ }.join("\n")

# We don't need any debugging code in our codebase
warn "Debugging code found - puts" if added_lines =~ /^.\s*puts\s/
fail "Debugging code found - binding.pry" if `grep -r binding.pry lib/ app/ spec/`.length > 1
fail "Debugging code found - p" if added_lines =~ /^.\s*p\s/
fail "Debugging code found - pp" if added_lines =~ /^.\s*pp\s/
fail "Debugging code found - debugger" if `grep -r debugger lib/ app/ spec/`.length > 1
fail "Debugging code found - console.log" if `grep -r console.log lib/ app/ spec/`.length > 1
fail "Debugging code found - require 'debug'" if `grep -r "require \'debug\'" lib/ app/ spec/`.length > 1

fail "Use spaces instead of tabs for indenting" if added_lines =~ /\t/

# We don't need default_scope in our codebase
if added_lines =~ /\bdefault_scope\b/
  fail "default_scope found. Please avoid this [bad practice](http://stackoverflow.com/a/25087337)"
end

# Warn if 'Gemfile' was modified and 'Gemfile.lock' was not
if git.modified_files.include?("Gemfile") && !git.modified_files.include?("Gemfile.lock")
  warn("`Gemfile` was modified but `Gemfile.lock` was not")
end

# Look for GIT merge conflicts
if `grep -r ">>>>\|=======\|<<<<<<<" app spec lib`.length > 1
  fail "Merge conflicts found"
 end

# Look for timezone issues
if `grep -r "Date.today\|DateTime.now\|Time.now" app spec lib`.length > 1
  warn("Please, use [explicit timezone](http://danilenko.org/2012/7/6/rails_timezones/)")
end
