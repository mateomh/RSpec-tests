require './lib/enumerable.rb'

describe Enumerable do
  include Enumerable

  describe 'My Each method' do
    it 'Takes each element of the object passed' do
      expect([1, 2, 5, 6, 8].my_each { |x| print x }).to eql([1, 2, 5, 6, 8].each { |x| print x })
    end
  end

  describe 'My all method' do
    let(:case1) { %w[ant bear cat] }
    let(:case2) { [1, 2i, 3.14] }
    let(:case3) { %w[a a] }
    let(:case4) { [1, 1] }
    let(:case5) { [] }
    let(:case6) { [nil, true, 99] }
    let(:case7) { [1, 2] }

    it 'GOOD CASE - Checks for a block passed with no argument' do
      expect(case1.my_all? { |word| word.length >= 3 }).to eql(case1.all? { |word| word.length >= 3 })
    end

    it 'GOOD CASE - Checks for REGEXP as an argument' do
      expect(case1.my_all?(/a/)).to eql(case1.all?(/a/))
    end

    it 'GOOD CASE - Checks for argument with a class and no block' do
      expect(case2.my_all?(Numeric)).to eql(case2.all?(Numeric))
    end

    it 'GOOD CASE - Checks a string as an argument' do
      expect(case3.my_all?('a')).to eql(case3.all?('a'))
    end

    it 'GOOD CASE - Checks for numeric argument with no block passed' do
      expect(case4.my_all?(1)).to eql(case4.all?(1))
    end

    it 'GOOD CASE - Checks for empty array with no argument and not block passed' do
      expect(case5.my_all?).to eql(case5.all?)
    end

    it 'BAD CASE - Checks for a block passed with no argument' do
      expect(case1.my_all? { |word| word.length >= 4 }).to eql(case1.all? { |word| word.length >= 4 })
    end

    it 'BAD CASE - Checks for REGEXP as an argument no block' do
      expect(case1.my_all?(/t/)).to eql(case1.all?(/t/))
    end

    it 'BAD CASE - Checks a string as an argument' do
      expect(case3.my_all?('a')).to eql(case3.all?('a'))
    end

    it 'BAD CASE - Checks when the input has different types insed it' do
      expect(case6.my_all?).to eql(case6.all?)
    end

    it 'BAD CASE - Checks for different numbers in the array' do
      expect(case7.my_all?(1)).to eql(case7.all?(1))
    end
  end

  describe 'My any method - good cases' do
    let(:case1) { %w[ant bear cat] }
    let(:case2) { [1, 2i, 3.14] }
    let(:case3) { %w[a a] }
    let(:case4) { [1, 1] }
    let(:case5) { [] }

    it 'Checks for a block passed with no argument' do
      expect(case1.my_any? { |word| word.length >= 3 }).to eql(case1.any? { |word| word.length >= 3 })
    end

    it 'Checks for REGEXP as an argument' do
      expect(case1.my_any?(/a/)).to eql(case1.any?(/a/))
    end

    it 'Checks for argument with a class and no block' do
      expect(case2.my_any?(Numeric)).to eql(case2.any?(Numeric))
    end

    it 'Checks a string as an argument' do
      expect(case3.my_any?('a')).to eql(case3.any?('a'))
    end

    it 'Checks for numeric argument with no block passed' do
      expect(case4.my_any?(1)).to eql(case4.any?(1))
    end

    it 'Checks for empty array with no argument and not block passed' do
      expect(case5.my_any?).to eql(case5.any?)
    end
  end

  describe 'My any method - bad cases' do
    let(:case1) { %w[ant bear cat] }
    let(:case2) { %w[a b] }
    let(:case3) { [nil, true, 99] }
    let(:case4) { [1, 2] }

    it 'Checks for a block passed with no argument' do
      expect(case1.my_any? { |word| word.length >= 4 }).to eql(case1.any? { |word| word.length >= 4 })
    end

    it 'Checks for REGEXP as an argument no block' do
      expect(case1.my_any?(/x/)).to eql(case1.any?(/x/))
    end

    it 'Checks a string as an argument' do
      expect(case2.my_any?('a')).to eql(case2.any?('a'))
    end

    it 'Checks when the input has different types inside it' do
      expect(case3.my_any?).to eql(case3.any?)
    end

    it 'Checks for different numbers in the array' do
      expect(case4.my_any?(1)).to eql(case4.any?(1))
    end
  end

  describe 'My none method - good cases' do
    let(:case1) { %w[ant bear cat] }
    let(:case2) { [1, 2i, 3.14] }
    let(:case3) { %w[a a] }
    let(:case4) { [1, 1] }
    let(:case5) { [] }

    it 'Checks for a block passed with no argument' do
      expect(case1.my_none? { |word| word.length >= 3 }).to eql(case1.none? { |word| word.length >= 3 })
    end

    it 'Checks for REGEXP as an argument' do
      expect(case1.my_none?(/a/)).to eql(case1.none?(/a/))
    end

    it 'Checks for argument with a class and no block' do
      expect(case2.my_none?(Numeric)).to eql(case2.none?(Numeric))
    end

    it 'Checks a string as an argument' do
      expect(case3.my_none?('a')).to eql(case3.none?('a'))
    end

    it 'Checks for numeric argument with no block passed' do
      expect(case4.my_none?(1)).to eql(case4.none?(1))
    end

    it 'Checks for empty array with no argument and not block passed' do
      expect(case5.my_none?).to eql(case5.none?)
    end
  end

  describe 'My none method - bad cases' do
    let(:case1) { %w[ant bear cat] }
    let(:case2) { %w[a b] }
    let(:case3) { [nil, true, 99] }
    let(:case4) { [1, 2] }

    it 'Checks for a block passed with no argument' do
      expect(case1.my_none? { |word| word.length >= 4 }).to eql(case1.none? { |word| word.length >= 4 })
    end

    it 'Checks for REGEXP as an argument no block' do
      expect(case1.my_none?(/x/)).to eql(case1.none?(/x/))
    end

    it 'Checks a string as an argument' do
      expect(case2.my_none?('a')).to eql(case2.none?('a'))
    end

    it 'Checks when the input has different types insed it' do
      expect(case3.my_none?).to eql(case3.none?)
    end

    it 'Checks for different numbers in the array' do
      expect(case4.my_none?(1)).to eql(case4.none?(1))
    end
  end

  describe 'My Count method - good cases' do
    let(:case1) { [1, 2, 9, 7, 11, 23, 8] }
    let(:case2) { (1..10) }

    it 'Checks for no arguments' do
      expect(case1.my_count).to eql(case1.count)
    end

    it 'Checks for an argument' do
      expect(case1.my_count(9)).to eql(case1.count(9))
    end

    it 'Checks for an expression as a argument' do
      expect(case1.my_count(&:even?)).to eql(case1.count(&:even?))
    end

    it 'Checks for range as an argument' do
      expect(case2.my_count).to eql(case2.count)
    end
  end

  describe 'My map method test cases' do
    let(:case1) { [1, 2, 7, 4, 5] }
    let(:my_proc) { proc { |x| x * x } }

    it 'Checks with block passed' do
      expect(case1.my_map { |x| x * x }).to eql(case1.map { |x| x * x })
    end

    it 'Checks for procedure as argument' do
      expect(case1.my_map(my_proc)).to eql(case1.map { |x| x * x })
    end

    it 'Checks for no arguments and no block given' do
      expect(case1.my_map.class).to eql(Enumerator)
    end
  end

  describe 'My inject method test cases' do
    let(:case1) { (5..10) }
    let(:flag) { false }

    it 'Checks for an expression as an argument' do
      expect(case1.my_inject(:*)).to eql(case1.inject(:*))
    end

    it 'Checks for block with no argument' do
      expect(case1.my_inject { |sum, n| sum + n }).to eql(case1.inject { |sum, n| sum + n })
    end

    it 'Checks for argument and block provided' do
      expect(case1.my_inject(2) { |sum, n| sum + n }).to eql(case1.inject(2) { |sum, n| sum + n })
    end

    it 'Checks for two arguments provided, one number and one expression' do
      expect(case1.my_inject(2, :*)).to eql(case1.inject(2, :*))
    end

    it 'Checks for no argument with block looks for an error raised' do
      begin
        case1.my_inject
      rescue StandardError
        flag = true
      end
      expect(flag).to eql(true)
    end
  end
end
