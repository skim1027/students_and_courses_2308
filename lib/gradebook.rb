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
    courses = @courses.map do |course|
      course
    end

    students = @courses.map do |course|
      course.students.map do |student|
        student
      end
    end
    all_students = Hash[courses.zip(students)]
  end

  def students_below(grade)
    @courses.map do |course|
      course.students.find_all do |student|
        student.grade < grade
      end
    end.flatten
  end

  def all_grades
    courses = @courses.map do |course|
      course
    end

    grades = @courses.map do |course|
      course.students.map do |student|
        student.grade
      end
    end
    all_students = Hash[courses.zip(grades)]
  end

  def students_in_range(low, high)
    @courses.map do |course|
      course.students.find_all do |student|
        student.grade < high && student.grade > low
      end
    end.flatten
  end
end