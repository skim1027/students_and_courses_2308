require 'rspec'
require './lib/course'
require './lib/student'
require 'pry'

RSpec.describe Course do
  before :each do
    @course = Course.new("Calculus", 2) 
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
  end

  describe '#initialize' do
    it 'initialize' do
      expect(@course).to be_a(Course)
    end

    it 'initialize with name' do
      expect(@course.name).to eq("Calculus")
    end

    it 'initialize with capacity' do
      expect(@course.capacity).to eq(2)
    end
  end

  describe '#students' do
    it 'is empty at first' do
      expect(@course.students).to eq([])
    end

    it 'shows enrolled studnets' do
      @course.enroll(@student1)
      @course.enroll(@student2)
      expect(@course.students).to eq([@student1, @student2])
    end
  end

  describe '#full?' do
    it 'shows it is not full' do
      expect(@course.full?).to be false
    end

    it 'shows its full' do
      @course.enroll(@student1)
      @course.enroll(@student2)
      expect(@course.full?).to be true
    end
  end
end
