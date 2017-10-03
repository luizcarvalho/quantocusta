require_relative '../quantocusta'
class Calculator
	PRECO_POR_HORA = 60
	EXCHANGE = 3.2

	def initialize		
	end

	def calculate(params = {})
		total = 0
		params.each_pair do |item, answer|
			total +=item_value(Constants::PARAMS[item][answer])
		end
		total
	end

	def item_value(value)
		(value*PRECO_POR_HORA)*EXCHANGE
	end
end