class Gradebook
  attr_reader :instructor, :courses
  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    all_students = {}
    
    courses = @courses.map do |course|
      course
    end

    students = @courses.map do |course|
      all_students[course.students] = []
        course.students.map do |student|
          student
          end
    end
    all_students = Hash[courses.zip(students)]
  end

  def students_below(grade)
    all_students = {}
    @courses.find_all do |course|
      all_students[course.students] = []
        course.students.map do |student|
          student.scores > grade
          end
    end
  end
end