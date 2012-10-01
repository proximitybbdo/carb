require 'octaplus'

describe Octaplus::Octaplus do
  it "octaplus is my Fuel" do
    Octaplus::Octaplus.init().should eql("Fuel!")
  end
end
