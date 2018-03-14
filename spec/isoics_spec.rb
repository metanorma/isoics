RSpec.describe Isoics do
  it "has a version number" do
    expect(Isoics::VERSION).not_to be nil
  end

  it "fetch field 01" do
    ics = Isoics.fetch fieldcode: "01"
    expect(ics).to be_instance_of Isoics::ICS
    expect(ics.code).to eq "01"
  end

  it "fetch field 01, group 140" do
    ics = Isoics.fetch fieldcode: "01", groupcode: "140"
    expect(ics).to be_instance_of Isoics::ICS
    expect(ics.groupcode).to eq "140"
    expect(ics.notes).to be_instance_of Array
    expect(ics.notes.first).to be_instance_of Isoics::Note
  end

  it "fetch field 01, group 140, subgroup 30" do
    ics = Isoics.fetch fieldcode: "01", groupcode: "140", subgroupcode: "30"
    expect(ics).to be_instance_of Isoics::ICS
    expect(ics.subgroupcode).to eq "30"
  end
end
