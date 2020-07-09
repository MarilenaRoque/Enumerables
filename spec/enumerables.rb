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

  describe '#my_all' do
    it "Returns true if all the elements are even" do
      expect([2,4,6,8].my_all?{|el| el.even?}).to eq(true)
    end

    it "Return false when not block given and there are false elements" do
      expect([false,"true",nil,1,10,2i].my_all?).to_not eq(true)
    end
  end

  describe '#my_any' do
    it "Returns true because one of the elements is even" do
      expect([1,7,8,5,1,1].my_any?{|el| el.even?}).to eq(true)
    end

    it "Return false because none of the elements are true and no block was given" do
      expect([false,nil,nil].my_any?).to_not eq(true)
    end

    it "Return false because none of the elements are true and no block was given" do
      expect([false,nil,nil].my_any?).to eq(false)
    end

    it "Testing if returns true when just a pattern is given" do
      expect(["test", nil, false, 1, 52].my_any?("test")).to eq(true)
    end

  end

  describe '#my_none' do
    it " Return false when every element is true and no block is given" do
      expect([1,"ada",2].my_none?).to eq(false)
    end

    it "Return true when every element returns false and a block is given" do
      expect(["one","two","four","five"].my_none?{|el| el.length>=10}).to eq(true)
    end

    it "Return true when every element returns false for a class pattern" do
      expect(["one","two","four","five"].my_none?(Integer)).to eq(true)
    end

  end

end