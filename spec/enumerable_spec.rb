require "./lib/enumerable.rb"

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

  #Good cases
  describe "My any method - good cases" do
    let(:case1) { %w[ant bear cat] }
    let(:case2) { [1, 2i, 3.14] }
    let(:case3) { ['a' 'a'] }
    let(:case4) { [1, 1] }
    let(:case5) { [] }

    it "Checks for a block passed with no argument" do
      expect(case1.my_any? { |word| word.length >= 3 }).to eql(case1.any? { |word| word.length >= 3 })
    end

    it "Checks for REGEXP as an argument" do
      expect(case1.my_any? (/a/)).to eql(case1.any? (/a/))
    end

    it "Checks for argument with a class and no block" do
      expect(case2.my_any? (Numeric)).to eql(case2.any? (Numeric))
    end

    it "Checks a string as an argument" do
      expect(case3.my_any? ('a')).to eql(case3.any? ('a'))
    end

    it "Checks for numeric argument with no block passed" do
      expect(case4.my_any? (1)).to eql(case4.any? (1))
    end

    it "Checks for empty array with no argument and not block passed" do
      expect(case5.my_any?).to eql(case5.any?)
    end
  end

    # Bad cases
    describe "My any method - bad cases" do
      let(:case1) { %w[ant bear cat] }
      let(:case2) { ['a' 'b'] }
      let(:case3) { [nil, true, 99] }
      let(:case4) { [1, 2] }
  
      it "Checks for a block passed with no argument" do
        expect(case1.my_any? { |word| word.length >= 4 }).to eql(case1.any? { |word| word.length >= 4 })
      end
  
      it "Checks for REGEXP as an argument no block" do
        expect(case1.my_any? (/x/)).to eql(case1.any? (/x/))
      end
  
      it "Checks a string as an argument" do
        expect(case2.my_any? ('a')).to eql(case2.any? ('a'))
      end
  
      it "Checks when the input has different types insed it" do
        expect(case3.my_any?).to eql(case3.any?)
      end
  
      it "Checks for different numbers in the array" do
        expect(case4.my_any? (1)).to eql(case4.any? (1))
      end
    end

     #Good cases
  describe "My any method - good cases" do
    let(:case1) { %w[ant bear cat] }
    let(:case2) { [1, 2i, 3.14] }
    let(:case3) { ['a' 'a'] }
    let(:case4) { [1, 1] }
    let(:case5) { [] }

    it "Checks for a block passed with no argument" do
      expect(case1.my_none? { |word| word.length >= 3 }).to eql(case1.none? { |word| word.length >= 3 })
    end

    it "Checks for REGEXP as an argument" do
      expect(case1.my_none? (/a/)).to eql(case1.none? (/a/))
    end

    it "Checks for argument with a class and no block" do
      expect(case2.my_none? (Numeric)).to eql(case2.none? (Numeric))
    end

    it "Checks a string as an argument" do
      expect(case3.my_none? ('a')).to eql(case3.none? ('a'))
    end

    it "Checks for numeric argument with no block passed" do
      expect(case4.my_none? (1)).to eql(case4.none? (1))
    end

    it "Checks for empty array with no argument and not block passed" do
      expect(case5.my_none?).to eql(case5.none?)
    end
  end

    # Bad cases
    describe "My none method - bad cases" do
      let(:case1) { %w[ant bear cat] }
      let(:case2) { ['a' 'b'] }
      let(:case3) { [nil, true, 99] }
      let(:case4) { [1, 2] }
  
      it "Checks for a block passed with no argument" do
        expect(case1.my_none? { |word| word.length >= 4 }).to eql(case1.none? { |word| word.length >= 4 })
      end
  
      it "Checks for REGEXP as an argument no block" do
        expect(case1.my_none? (/x/)).to eql(case1.none? (/x/))
      end
  
      it "Checks a string as an argument" do
        expect(case2.my_none? ('a')).to eql(case2.none? ('a'))
      end
  
      it "Checks when the input has different types insed it" do
        expect(case3.my_none?).to eql(case3.none?)
      end
  
      it "Checks for different numbers in the array" do
        expect(case4.my_none? (1)).to eql(case4.none? (1))
      end
    end

    #My Countt
    describe "My Count method - good cases" do
      let(:case1) { [1, 2, 9, 7, 11, 23, 8] }
      let(:case2) { (1..10) }
  
      it "Checks for no arguments" do
        expect(case1.my_count).to eql(case1.count)
      end
  
      it "Checks for an argument" do
        expect(case1.my_count(9)).to eql(case1.count(9))
      end

      it "Checks for an expression as a argument" do
        expect(case1.my_count(&:even?)).to eql(case1.count(&:even?))
      end

      it "Checks for range as an argument" do
        expect(case2.my_count()).to eql(case2.count())
      end
    end
end