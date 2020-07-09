require '../main.rb'

describe Enumerable do
  describe '#my_each' do
    it "do a task and return self when self is an array" do
      expect([1, 2, 3].my_each{|el| puts el }).to eq([1,2,3])
    end
    it "do a task and return self when self is a range" do
      expect((1..5).my_each{|el| puts el }).to eq((1..5))
    end
    it "do a task and return self when self is a hash" do
      expect({"cat"=>0, "dog"=>1, "wombat"=>2}.my_each{|el| puts el }).to eq({"cat"=>0, "dog"=>1, "wombat"=>2})
    end
  end
end