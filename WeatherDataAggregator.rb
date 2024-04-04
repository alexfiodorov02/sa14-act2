require 'httparty'
require 'json'

api_key = "121d31c07b8a4848b5094341240404"
city = "Memphis"

response = HTTParty.get("http://api.weatherapi.com/v1/current.json?key=<#{api_key}>&q=#{city}")

pp response

data = JSON.parse(response.body)

# Extract the weather data for each hour
temperatures = data['list'].map { |hour| hour['main']['temp'] }

# Calculate the average temperature
average_temperature = temperatures.sum / temperatures.size

puts "Average Temperature: #{average_temperature}"
