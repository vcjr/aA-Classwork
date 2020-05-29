require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name, @funding, @salaries = name, funding, salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title) ? true : false 
    end

    def >(second_startup)
        self.funding > second_startup.funding ? true : false
    end

    def hire(person_name, title)
        valid_title?(title) ? @employees << Employee.new(person_name, title) : (raise "Invalid Title!!!") 
    end

    def size
        @employees.size
    end

    def pay_employee(employee)
        if @funding > salaries[employee.title]
            employee.pay(salaries[employee.title])
            @funding -= salaries[employee.title]
        else
            raise "Not enough funding to pay employee..."
        end
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee) }
    end

    def average_salary
        sum = 0
        @employees.each { |employee| sum += salaries[employee.title] }
        sum / @employees.length
    end
    
    def close
        @employees, @funding = [], 0
    end

    def acquire(second_startup)
        @funding += second_startup.funding
        second_startup.salaries.each { |title, pay| @salaries[title] = pay if !@salaries.has_key?(title) }
        second_startup.employees.each { |employee| @employees << employee }
        second_startup.close
    end
end
