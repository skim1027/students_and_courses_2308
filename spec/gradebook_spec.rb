require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'
require 'pry'

RSpec.describe Gradebook do
  before :each do
    @gradebook = Gradebook.new("Abdul")
    @calculus = Course.new("Calculus", 2)
    @science = Course.new("Science", 3)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
    @student3 = Student.new({name: "Zach", age: 20})
    @student4 = Student.new({name: "Carrie", age: 50})
    @student5 = Student.new({name: "Bob", age: 60})
  end

  describe '#initialize' do
    it 'initialize' do
      expect(@gradebook).to be_a(Gradebook)
    end

    it 'intialize with instructor' do
      expect(@gradebook.instructor).to eq("Abdul")
    end
  end

  describe '#courses' do
    it 'is empty at first' do
      expect(@gradebook.courses).to eq([])
    end

    it 'shows list of courses' do
      @gradebook.add_course(@calculus)
      @gradebook.add_course(@science)

      expect(@gradebook.courses).to eq([@calculus, @science]) 
    end
  end

  describe '#list_all_students' do
    it 'list all students' do
      @gradebook.add_course(@calculus)
      @gradebook.add_course(@science)
      @calculus.enroll(@student1)
      @calculus.enroll(@student2)
      @science.enroll(@student3)
      @science.enroll(@student4)
      @science.enroll(@student5)

      expect(@gradebook.list_all_students).to be_a(Hash)
      expect(@gradebook.list_all_students.values).to be_a(Array)
    end
  end

  describe '#students_below(threshold)' do
    it 'shows students below grade' do
      @gradebook.add_course(@calculus)
      @calculus.enroll(@student1)
      @calculus.enroll(@student2)
      @student1.log_score(30)
      @student2.log_score(60)
      expect(@gradebook.students_below(50)).to eq([@student1])
    end
  end

  describe '#all_grades' do
    it 'shows all grades' do
      @gradebook.add_course(@calculus)
      @calculus.enroll(@student1)
      @calculus.enroll(@student2)
      @student1.log_score(30)
      @student1.log_score(50)
      @student2.log_score(30)
      @student2.log_score(60)
      @gradebook.add_course(@science)
      @science.enroll(@student3)
      @science.enroll(@student4)
      @science.enroll(@student5)
      @student3.log_score(60)
      @student3.log_score(70)
      @student4.log_score(90)
      @student4.log_score(100)
      @student5.log_score(90)
      @student5.log_score(70)

      expect(@gradebook.all_grades).to eq({@calculus => [@student1.grade, @student2.grade], @science => [@student3.grade, @student4.grade, @student5.grade]})
    end
  end

  describe '#students_in_range' do
    it 'gives students in range' do
      @gradebook.add_course(@calculus)
      @calculus.enroll(@student1)
      @calculus.enroll(@student2)
      @student1.log_score(30)
      @student1.log_score(50)
      @student2.log_score(30)
      @student2.log_score(60)
      @gradebook.add_course(@science)
      @science.enroll(@student3)
      @science.enroll(@student4)
      @science.enroll(@student5)
      @student3.log_score(60)
      @student3.log_score(70)
      @student4.log_score(90)
      @student4.log_score(100)
      @student5.log_score(90)
      @student5.log_score(70)
      expect(@gradebook.students_in_range(30, 70)).to eq([@student1, @student2, @student3])
    end
  end
end