# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Alumni::Application.initialize!
Date::DATE_FORMATS[:date_deployed] = "%B %e, %Y"
