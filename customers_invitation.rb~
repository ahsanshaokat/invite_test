require 'distance_calculator'
require 'json'

class CustomersInvitation

	# which are x kms away from provided base location's coordinates.

	attr_accessor :customers, :invited_customers, :base_latitude, :base_longitude
	def initialize(filepath=File.expand_path("customers.json"), dublin_latitude="53.339428", dublin_longitude="-6.257664")
		begin
			@customers = _parse(filepath)
			@base_latitude = dublin_latitude
			@base_longitude = dublin_longitude
		rescue => err
			raise err
		end
	end

	def invite_within_kms(invitation_radius_in_km=100)
		_find_customers_to_be_invited(invitation_radius_in_km)
	end

	def display_invited
		_output
	end

	private

	def _parse(filepath)
		customers_json = []
		File.readlines(filepath).each do |customer|
			customers_json << JSON.parse(customer)
		end
		customers_json
	end

	def _find_customers_to_be_invited(invitation_radius_in_km)
		_invited_customers = []
		@customers.each do |customer|
			distance = DistanceCalculator.calculate(@base_latitude, @base_longitude, customer["latitude"], customer["longitude"])
			if (distance <= invitation_radius_in_km)
				_invited_customers << customer
			end
		end
		@invited_customers = _invited_customers.sort_by { |ic| ic["user_id"] }
	end

	# customer_name - customer_id
	def _output
		@invited_customers.each do |invited_customer|
			puts "#{invited_customer["name"]} - #{invited_customer["user_id"]}"
		end
	end

end

v = CustomersInvitation.new
v.display_invited
