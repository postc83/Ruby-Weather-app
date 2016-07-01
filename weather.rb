require 'barometer'

puts ""
puts "--------------------------------"
puts ""
puts "-- Welcome to the WEATHER APP --"
puts ""
puts "--------------------------------"
puts "\nPlease enter search location: zip code or city"

user_location = gets.chomp

def forecast(location)

	barometer = Barometer.new(location).measure

end

weather = forecast(user_location)
today = Time.now.strftime("%d")

puts ""
puts "#{user_location.upcase} is currently: #{weather.current.condition}"
puts weather.temperature
puts ""

weather.forecast.each do |forecast|
	day = forecast.starts_at.strftime("%-d").to_i

	if day == today.to_i + 1
		day = "Tommorrow"
	else
		day = forecast.starts_at.strftime("%a")
	end

	puts "*** #{day} *** looks like #{forecast.icon} with a low of #{forecast.low} and a high of #{forecast.high} degrees celsius" 
	puts ""
end


