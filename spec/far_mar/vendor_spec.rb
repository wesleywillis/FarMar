require "spec_helper"

describe FarMar do
  describe FarMar::Vendor do
    before :each do
    #  @vendor = FarMar::Vendor.new
    end

    describe "#initialize" do
      it "creates a new instance of Vendor" do
        fake_hash = {:id => 666, :name => "Boo Boo", :team_size => 12, :market_id => 555}
        test = FarMar::Vendor.new(fake_hash)
        expect(test).to be_an_instance_of FarMar::Vendor
      end
    end

    describe '#self.all' do
      it "returns a collection of Vendor instances" do
        expect(FarMar::Vendor.all.length).to eq CSV.read("support/vendors.csv").length
      end
    end

    describe "self.find(id)" do
      it "returns specific instance of vendor" do
        find_test = FarMar::Vendor.find(15)
        expect(find_test.name).to eq "Hyatt-King"
      end
    end

    describe "list_markets" do
      it "returns specific market instance" do
        market_test = FarMar::Vendor.find(20)
        expect(market_test.list_markets.name).to eq "Jefferson City Farmer's Market"

      end
    end

    describe "list_products" do
      it "returns array of product instances" do
        product_test = FarMar::Vendor.find(100)
        product_test.list_products.each do |product|
          expect(product.vendor_id).to eq 100
        end
      end
    end

    describe "list_sales" do
      it "returns array of sale instances" do
        sale_test = FarMar::Vendor.find(50)
        sale_test.list_sales.each do |sale|
          expect(sale.vendor_id).to eq 50
        end
      end
    end

    describe "self.by_market" do
      it "returns array of vendors" do
        testcase = FarMar::Vendor.by_market(27)
        testcase.each do |vendor|
          expect(vendor.list_markets.name).to eq "Pinckneyville Farmers Market"
        end
      end
    end

    describe "revenue" do
      it "returns vendor's total $" do
        vendor_example = FarMar::Vendor.find(68)
        expect(vendor_example.revenue).to eq 31308
      end
    end
  end
end
