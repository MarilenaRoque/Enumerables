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

  describe '#my_each_with_index' do
    it "Return an enumerator when no blocks given" do 
      result = [1,2,6].my_each_with_index
      expect(result.class).to eq(Enumerator) 
    end
    it "Expected an array witch each element is the value and the index as a string" do 
      array=[]
      [1,2,6].my_each_with_index {|el,index| array << el.to_s + index.to_s}      
      expect(array).to eq(%w(10 21 62))
    end
  end

  describe '#my_select' do
    it "return an array with the even numbers inside the original array" do
      expect([1,2,3,4].my_select {|el| el.even?}).to eq([2,4])
    end

    it "return an array with the even numbers inside the range" do
      expect((1..10).my_select {|el| el.even?}).to eq([2,4,6,8,10])
    end
    
    it "Return an enumerator when no blocks given" do 
      result = [1,2,6].my_select
      expect(result.class).to eq(Enumerator) 
    end
  end
end