require_relative '../quantocusta'
class Calculator
	PRECO_POR_HORA = 60
	EXCHANGE = 3.0

	def self.calculate(params = {})
		total = 0
		params = safely_params(params)
		params.each_pair do |item, answer|
			total += item_value(Constants::PARAMS[item][answer])
		end
		total
	end

	def self.safely_params(params)
		params = params.delete_if { |k, v| v.to_s.empty? }
		params = params.delete_if { |k, v| !Constants::PARAMS.keys.include?(k) }
	end

	def self.item_value(value)
		return 0 unless value
		(value*PRECO_POR_HORA)*EXCHANGE
	end
end
