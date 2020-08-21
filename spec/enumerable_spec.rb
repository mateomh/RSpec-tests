require "../lib/enumerable.rb"

describe Enumerable do
  include Enumerable

  # describe "My Each" do
  #   it "Takes each element of the object passed" do
  #       expect([1,2,5,6,8].my_each {|x| print x}).to eql([1,2,5,6,8].each {|x| print x})
  #   end
  # end

  # Good cases
  describe "My all" do
    let(:case1) { %w[ant bear cat] }
    let(:case2) { [1, 2i, 3.14] }
    let(:case3) { [nil, true, 99] }
    let(:case4) { [1, 1] }
    let(:case5) { [] }

    it "Checks all the elements in case1 to be 3 letters in length" do
      expect(case1.my_all? { |word| word.length >= 3 }).to eql(case1.all? { |word| word.length >= 3 })
    end

    it "Checks all the elements in case2 to be numbers" do
      expect(case2.my_all? (Numeric)).to eql(case2.all? (Numeric))
    end

    it "Checks all the elements in case 4 to be the number 1" do
      expect(case4.my_all? (1)).to eql(case4.all? (1))
    end

    it "Checks for empty array to work" do
      expect(case5.my_all?).to eql(case5.all?)
    end

  end
end