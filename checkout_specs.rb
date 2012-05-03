require File.dirname(__FILE__) + '/checkout'

describe Checkout do
	it "should return 0 for no products" do
		checkout = Checkout.new
		checkout.scan ""
		checkout.total.should == 0
	end

	it "should return 50 for A" do
		checkout = Checkout.new
		checkout.scan "A"
		checkout.total.should == 50
	end

	it "should return 80 for AB" do
		checkout = Checkout.new
		checkout.scan "A"
		checkout.scan "B"
		checkout.total.should == 80
	end

	it "should return 115 for CDBA" do
		checkout = Checkout.new
		checkout.scan "C"
		checkout.scan "D"
		checkout.scan "B"
		checkout.scan "A"
		checkout.total.should == 115
	end

	it "should return 100 for AA" do
		checkout = Checkout.new
		checkout.scan "A"
		checkout.scan "A"
		checkout.total.should == 100
	end

	it "should return 130 for AAA" do
		checkout = Checkout.new
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "A"
		checkout.total.should == 130
	end

	it "should return 180 for AAAA" do
		checkout = Checkout.new
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "A"
		checkout.total.should == 180
	end

	it "should return 230 for AAAAA" do
		checkout = Checkout.new
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "A"
		checkout.total.should == 230
	end

	it "should return 260 for AAAAAA" do
		checkout = Checkout.new
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "A"
		checkout.total.should == 260
	end

	it "should return 160 for AAAB" do
		checkout = Checkout.new
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "B"
		checkout.total.should == 160
	end

	it "should return 175 for AAABB" do
		checkout = Checkout.new
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "B"
		checkout.scan "B"
		checkout.total.should == 175
	end

	it "should return 190 for AAABBD" do
		checkout = Checkout.new
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "A"
		checkout.scan "B"
		checkout.scan "B"
		checkout.scan "D"
		checkout.total.should == 190
	end
	
	it "should return 190 for DABABA" do
		checkout = Checkout.new
		checkout.scan "D"
		checkout.scan "A"
		checkout.scan "B"
		checkout.scan "A"
		checkout.scan "B"
		checkout.scan "A"
		checkout.total.should == 190
	end
end