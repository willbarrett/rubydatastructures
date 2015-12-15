require 'spec_helper'
require_relative '../../lists/singly_linked_list'

describe SinglyLinkedList do

  subject { SinglyLinkedList.new }

  describe "new" do
    it "has a size of 0" do 
      expect(subject.size).to eql(0)
    end
    
    it { is_expected.to be_empty }
  end

  describe "#push" do
    before :each do
      subject.push('uggabugga')
      subject.push('kowabunga')
    end
    it "increases the size by 1" do
      expect(subject.size).to eql(2)
    end

    it "sets the proper value" do
      expect(subject.get(0)).to eql('uggabugga')
      expect(subject.get(1)).to eql('kowabunga')
    end
  end

  describe "#pop" do
    before :each do
      subject.push('uggabugga')
      subject.push('kowabunga')
    end
    it "reduces the size by 1" do
      subject.pop
      expect(subject.size).to eql(1)
      subject.pop
      expect(subject.size).to eql(0)
    end

    it "returns the proper value" do
      expect(subject.pop).to eql("kowabunga")
      expect(subject.pop).to eql("uggabugga")
    end
  end

  describe "#unshift" do
    before :each do
      subject.push("uggabugga")
      subject.unshift("kowabunga")
    end
    it "adds the element to the beginning of the list" do
      expect(subject.get(0)).to eql("kowabunga")
    end

    it "increments the size" do
      expect(subject.size).to eql(2)
    end
  end
  
  describe "#shift" do
    before :each do
      subject.push('uggabugga')
      subject.push('kowabunga')
    end

    it "returns the first element of the array" do
      expect(subject.shift).to eql("uggabugga")
    end
  end

  describe "#insert" do
    before :each do
      subject.push('uggabugga')
      subject.push('kowabunga')
      subject.insert(1, 'hang10')
    end

    it "inserts the item at the proper position" do
      expect(subject.get(0)).to eql('uggabugga')
      expect(subject.get(1)).to eql('hang10')
      expect(subject.get(2)).to eql('kowabunga')
    end
  end

  describe "#remove" do
    before :each do
      subject.push('uggabugga')
      subject.push('kowabunga')
      subject.push('hang10')
      subject.remove(1)
    end

    it "removes the proper item" do
      expect(subject.get(0)).to eql('uggabugga')
      expect(subject.get(1)).to eql('hang10')
      expect(subject.size).to eql(2)
    end
  end

  describe "#reverse!" do
    before :each do
      subject.push('uggabugga')
      subject.push('kowabunga')
      subject.push('hang10')
    end

    it "reverses the list" do
      subject.reverse!
      expect(subject.get(0)).to eql('hang10')
      expect(subject.get(1)).to eql('kowabunga')
      expect(subject.get(2)).to eql('uggabugga')
    end
  end

end
