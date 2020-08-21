require "../lib/enumerable.rb"

describe Enumerable do
  include Enumerable

  # describe "My Each" do
  #   it "Takes each element of the object passed" do
  #       expect([1,2,5,6,8].my_each {|x| print x}).to eql([1,2,5,6,8].each {|x| print x})
  #   end
  # end

  # Good cases
  describe "My all method - good cases" do
    let(:case1) { %w[ant bear cat] }
    let(:case2) { [1, 2i, 3.14] }
    let(:case3) { ['a' 'a'] }
    let(:case4) { [1, 1] }
    let(:case5) { [] }

    it "Checks for a block passed with no argument" do
      expect(case1.my_all? { |word| word.length >= 3 }).to eql(case1.all? { |word| word.length >= 3 })
    end

    it "Checks for REGEXP as an argument" do
      expect(case1.my_all? (/a/)).to eql(case1.all? (/a/))
    end

    it "Checks for argument with a class and no block" do
      expect(case2.my_all? (Numeric)).to eql(case2.all? (Numeric))
    end

    it "Checks a string as an argument" do
      expect(case3.my_all? ('a')).to eql(case3.all? ('a'))
    end

    it "Checks for numeric argument with no block passed" do
      expect(case4.my_all? (1)).to eql(case4.all? (1))
    end

    it "Checks for empty array with no argument and not block passed" do
      expect(case5.my_all?).to eql(case5.all?)
    end
  end

  # Bad cases
  describe "My all method - bad cases" do
    let(:case1) { %w[ant bear cat] }
    let(:case2) { ['a' 'b'] }
    let(:case3) { [nil, true, 99] }
    let(:case4) { [1, 2] }

    it "Checks for a block passed with no argument" do
      expect(case1.my_all? { |word| word.length >= 4 }).to eql(case1.all? { |word| word.length >= 4 })
    end

    it "Checks for REGEXP as an argument no block" do
      expect(case1.my_all? (/t/)).to eql(case1.all? (/t/))
    end

    it "Checks a string as an argument" do
      expect(case2.my_all? ('a')).to eql(case2.all? ('a'))
    end

    it "Checks when the input has different types insed it" do
      expect(case3.my_all?).to eql(case3.all?)
    end

    it "Checks for different numbers in the array" do
      expect(case4.my_all? (1)).to eql(case4.all? (1))
    end
  end
end