require_relative "employee"

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss = nil)
        super(name, salary, title, boss)
        @employees = []                         # [darren]
    end

    def add_employees(employee)
        self.employees << employee
    end

    def bonus(multiplier)
        self.total_sub_salary * multiplier
    end

    def total_sub_salary
        # get the total sum of sub-employees
        total_salary = 0
        self.employees.each do |employee|
            # sum + employee.salary
            if employee.is_a?(Manager)
                total_salary += employee.salary + employee.total_sub_salary
            else
                total_salary += employee.salary
            end
        end
    end
end 

ned = Manager.new("Ned", 10000000, "founder", nil)
darren = Manager.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)

ned.add_employees(darren)
darren.add_employees(shawna)
darren.add_employees(david)

p ned.bonus(5)          # => 500_000
p darren.bonus(4)       # => 88_000
p david.bonus(3)        # => 30_000