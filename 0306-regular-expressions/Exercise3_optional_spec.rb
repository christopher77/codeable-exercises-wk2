require_relative "Exercise3_optional"

RSpec.describe "test #Exercise3_optional" do

    it "validate case 1" do
        expect(stress ("10sion")).to eq("9pen")
    end
    it "validate case 2" do
        expect(stress ("9tion")).to eq("8pen")
    end
    it "validate case 3" do
        expect(stress ("11ic")).to eq("10pen")
    end
    it "validate case 4" do
        expect(stress ("3ious")).to eq("2pen")
    end
    it "validate case 5" do
        expect(stress ("8ty")).to eq("6ante-pen")
    end
    it "validate case 6" do
        expect(stress ("3al")).to eq("1ante-pen")
    end
    it "validate case 7" do
        expect(stress ("11ise")).to eq("9ante-pen")
    end
    it "validate case 8" do
        expect(stress ("5ate")).to eq("3ante-pen")
    end
    it "validate case 9" do
        expect(stress ("12ise")).to eq("invalid word")
    end
    it "validate case 10" do
        expect(stress ("5ale")).to eq("invalid word")
    end
    it "validate case 1" do
        expect(stress ("ise")).to eq("invalid word")
    end
    it "validate case 11" do
        expect(stress ("1000ale")).to eq("invalid word")
    end
end