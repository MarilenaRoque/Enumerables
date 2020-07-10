require '../main.rb'

describe Enumerable do
  describe '#my_each' do
    it 'do a task and return self when self is an array' do
      expect([1, 2, 3].my_each { |el| puts el }).to eq([1, 2, 3])
    end
    it 'do a task and return self when self is a range' do
      expect((1..5).my_each { |el| puts el }).to eq((1..5))
    end
    it 'do a task and return self when self is a hash' do
      result = { 'cat' => 0, 'dog' => 1, 'wombat' => 2 }.my_each { |el| puts el }
      expect(result).to eq('cat' => 0, 'dog' => 1, 'wombat' => 2)
    end
  end

  describe '#my_each_with_index' do
    it 'Return an enumerator when no blocks given' do
      result = [1, 2, 6].my_each_with_index
      expect(result.class).to eq(Enumerator)
    end
    it 'Expected an array witch each element is the value and the index as a string' do
      array = []
      [1, 2, 6].my_each_with_index { |el, index| array << el.to_s + index.to_s }
      expect(array).to eq(%w[10 21 62])
    end
  end

  describe '#my_select' do
    it 'return an array with the even numbers inside the original array' do
      expect([1, 2, 3, 4].my_select(&:even?)).to eq([2, 4])
    end

    it 'return an array with the even numbers inside the range' do
      expect((1..10).my_select(&:even?)).to eq([2, 4, 6, 8, 10])
    end

    it 'Return an enumerator when no blocks given' do
      result = [1, 2, 6].my_select
      expect(result.class).to eq(Enumerator)
    end
  end

  describe '#my_all' do
    it 'Returns true if all the elements are even' do
      expect([2, 4, 6, 8].my_all?(&:even?)).to eq(true)
    end

    it 'Return false when not block given and there are false elements' do
      expect([false, 'true', nil, 1, 10, 2i].my_all?).to_not eq(true)
    end
  end

  describe '#my_any' do
    it 'Returns true because one of the elements is even' do
      expect([1, 7, 8, 5, 1, 1].my_any?(&:even?)).to eq(true)
    end

    it "Don't return true because none of the elements are true and no block was given" do
      expect([false, nil, nil].my_any?).to_not eq(true)
    end

    it 'Return false because none of the elements are true and no block was given' do
      expect([false, nil, nil].my_any?).to eq(false)
    end

    it 'Testing if returns true when just a pattern is given' do
      expect(['test', nil, false, 1, 52].my_any?('test')).to eq(true)
    end
  end

  describe '#my_none' do
    it ' Return false when every element is true and no block is given' do
      expect([1, 'ada', 2].my_none?).to eq(false)
    end

    it 'Return true when every element returns false and a block is given' do
      expect(%w[one two four five].my_none? { |el| el.length >= 10 }).to eq(true)
    end

    it 'Return true when every element returns false for a class pattern' do
      expect(%w[one two four five].my_none?(Integer)).to eq(true)
    end
  end

  describe '#my_count' do
    it ' Returns the number of strings equal a pattern given inside an array' do
      expect([1, 'ada', 2, 'mari', 'jasem'].my_count('jasem')).to eq(1)
    end

    it ' Returns the number of elements when no pattern or block is given inside an array' do
      expect([1, 'ada', 2, 'mari', 'jasem'].my_count).to eq(5)
    end

    it ' Returns the number of strings inside the array' do
      expect([1, 'ada', 2, 'mari', 'jasem'].my_count { |el| el.class == String }).to eq(3)
    end
  end

  describe '#my_map' do
    it 'Return a new array modify by the block condition' do
      expect([1, 2, 6].my_map { |el| el + 2 }).to eq([3, 4, 8])
    end
    it 'Return a new array from a range modify by the block condition' do
      expect((1..6).my_map { |el| el - 1 }).to eq([0, 1, 2, 3, 4, 5])
    end
    it 'Fill a new array with the element given in the block with the same lenght of the original one' do
      expect((1..6).my_map { 'jasem' }).to eq(%w[jasem jasem jasem jasem jasem jasem])
    end
  end

  describe '#my_inject' do
    it 'Returns the sum of every element inside an array, using a symbol argument' do
      expect([1, 2, 6].my_inject(:+)).to eq(9)
    end

    it 'Returns the sum every element inside an array plus 10, using a symbol and a initial value as arguments' do
      expect([1, 2, 6].my_inject(10, :+)).to eq(19)
    end

    it 'Returns the sum every element twice inside an array using a block' do
      result = [1, 2, 3].my_inject { |memo, el| memo + el + el }
      expect(result).to eq(11)
    end

    it 'Returns the longest word inside an array' do
      longest = %w[cat sheep bear].inject do |memo, word|
        memo.length > word.length ? memo : word
      end
      expect(longest).to eq('sheep')
    end
  end

  describe '#multiply_els' do
    it 'Returns all elements of the array multiplied receiving the array as argument' do
      expect(multiply_els([1, 2, 3, 4])).to eq(24)
    end
    it 'Returns all elements of the range multiplied receiving a range as argument' do
      expect(multiply_els((1..5))).to eq(120)
    end
  end
end
