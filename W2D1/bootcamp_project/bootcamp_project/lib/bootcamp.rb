class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |grades, student| grades[student] = [] }
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(string)
        @teachers << string
    end

    def enroll(student)
        if @student_capacity > @students.length
            @students << student
            true
        else
            false
        end
    end 

    def enrolled?(student)
        @students.include?(student)
    end
    
    def student_to_teacher_ratio
        ratio = students.length / teachers.length
        ratio.floor
    end

    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student] << grade
            true
        else 
            false
        end
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        if @grades.has_key?(student) && @grades[student].length > 0
            (@grades[student].sum / @grades[student].length).floor
        else
            nil
        end
    end
end