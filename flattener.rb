class Flattener
  def self.flatten(arr)
    raise "An Array must be passed" unless arr.is_a? Array
    arr.compact.reduce([]) do |result, item|
      if item.is_a? Array
        result += flatten(item)
      else
        result << item
      end
    end
  end
end

describe "flatten" do

  it "raises an error if an array is not passed" do
    expect {Flattener.flatten(3)}.to raise_error(RuntimeError, "An Array must be passed")
  end

  it "should flatten an array" do
    flattened = Flattener.flatten([1,2,3])
    expect(flattened).to eq([1,2,3])
  end

  it "should flatten a nested array" do
    flattened = Flattener.flatten([1,["a", "b"],2,3])
    expect(flattened).to eq([1,"a","b",2,3])
  end

  it "should flatten multiple nested arrays" do
    flattened = Flattener.flatten([1, 2, [3, [4, 5]], 6])
    expect(flattened).to eq([1,2,3,4,5,6])
  end
end

