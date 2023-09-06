class Student
  attr_reader :name, :age, :scores
  def initialize(info)
    @name = info[:name]
    @age = info[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end

  def grade
    count = @scores.count
    sum = (@scores.sum).to_f
    grade = (sum/count).to_f
  end
end
