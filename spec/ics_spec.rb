RSpec.describe Isoics::ICS do
  context "initialize" do
    it "code not found" do
      expect do
        described_class.new(fieldcode: "01", groupcode: "01", subgroupcode: "01")
      end.to output("[isoics] code \"01.01.01\" not found in ICS list\n").to_stderr
    end
  end
end
