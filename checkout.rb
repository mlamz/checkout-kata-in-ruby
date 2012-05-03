class Checkout
	attr_reader :total_without_discounts

	def initialize
		@total_without_discounts = 0
		
		@prices = { 
		"A" => 50,
		"B" => 30,
		"C" => 20,
		"D" => 15
		}

		@items = []
	end

	def scan(item_to_scan)
		if item_to_scan != ""
			@items.push item_to_scan
			@total_without_discounts += @prices[item_to_scan]
		end
	end

	def calculate_discount
		
		total_discount = 0

		triple_A_discounts_to_apply = (@items.select { | x | x == "A" }.size / 3).floor
		double_B_discounts_to_apply = (@items.select { | x | x == "B" }.size / 2).floor
		
		total_discount += (triple_A_discounts_to_apply * 20)
		total_discount += (double_B_discounts_to_apply * 15)
		
		return total_discount
	end

	def total
		@total_without_discounts - self.calculate_discount
	end
end