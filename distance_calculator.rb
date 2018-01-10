class DistanceCalculator

	# DistanceCalculator calculates distance in kms between two coordinates

	def self.calculate(latitude_1, longitude_1, latitude_2, longitude_2)
		_calculate(latitude_1.to_f, longitude_1.to_f, latitude_2.to_f, longitude_2.to_f)
	end

	private

	def self._calculate(latitude_1, longitude_1, latitude_2, longitude_2)
    latitude_diff  = (latitude_1 - latitude_2) * (Math::PI / 180.0)
    longitude_diff = (longitude_1 - longitude_2) * (Math::PI / 180.0)

    a = Math.sin(latitude_diff/2)**2 + Math.cos((latitude_1 * (Math::PI / 180.0))) * Math.cos((latitude_2 * (Math::PI / 180.0))) * Math.sin(longitude_diff/2) ** 2
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

    return (c * 6371.00).round(2) # 6371.00 is Earth's radius in kms
	end
end
