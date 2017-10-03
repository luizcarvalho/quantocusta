require 'calculator'

describe Calculator do

	let(:calculator) { Calculator.new }
	let(:params) {
    {
      'attribute_1' => 'value1',
      'attribute_2' => 'value2'
    }
	}

	let(:defined_params) {		
		{
		  'attribute_1' => {
			  'value1' => 2
		  },
			'attribute_2' => {
				'value2' => 4
			}
		}
	}

	let(:preco_por_hora) { 10 }
	let(:exchange) { 2 }

	before(:each) do
		Constants.send(:remove_const, :PARAMS)
		Constants.const_set(:PARAMS, defined_params)

		Calculator.send(:remove_const, :PRECO_POR_HORA)
		Calculator.const_set(:PRECO_POR_HORA, preco_por_hora)

		Calculator.send(:remove_const, :EXCHANGE)
		Calculator.const_set(:EXCHANGE, exchange)
	end

	it '#item_value' do
		expect(calculator.item_value(2)).to eq(40) # 2*2*10
	end

	it '#calculate' do
		expect(calculator.calculate(params)).to eq(120)
	end
end