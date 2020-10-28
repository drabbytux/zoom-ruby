class Employee

  attr_reader :name

  def initialize (name = "Anonymous")
    self.name = name
  end

  def name=(name)
    if name == ""
      raise "Name can't be blank!"
    end
    @name = name
  end

  def print_name
    puts "Name: #{name}"
  end
end

class SalariedEmployee < Employee
  attr_reader :salary

  def initialize (name = "Anonymous", salary = 0.0)
    super(name)
    self.salary = salary
  end

  def salary=(salary)
    # Code to validate
    if salary < 0
      raise "A salary of #{salary} isn't valid."      
    end
    @salary = salary
  end

  def print_pay_stub
    print_name
    pay_for_period = (salary / 365.0) * 14
    formatted_pay = format("$%.2f", pay_for_period)
    puts "Pay This Period: #{formatted_pay}"
  end
end

class HourlyEmployee < Employee

  attr_reader :hourly_wage, :hours_per_week

  def initialize (name = "Anonymous", hourly_wage = 0.0, hours_per_week = 0.0)
    super(name)
    self.hourly_wage = hourly_wage
    self.hours_per_week = hours_per_week
  end

  def hourly_wage=(hourly_wage)
    if hourly_wage >= 0
      @hourly_wage = hourly_wage
    else
      raise "No hourly wage set"
    end
  end

  def hours_per_week=(hours_per_week)
    if hours_per_week >= 0
      @hours_per_week = hours_per_week
    else
      raise "No hours set"
    end
  end

  def print_pay_stub
    print_name
    pay_for_period = hourly_wage * hours_per_week * 2
    formatted_pay = format("$%.2f", pay_for_period)
    puts "Pay This Period: #{formatted_pay}"
  end

  def self.security_guard(name)
    HourlyEmployee.new(name, 19.25, 30)
  end

  def self.cashier(name)
    HourlyEmployee.new(name, 12.75, 25)
  end

  def self.janitor(name)
    HourlyEmployee.new(name, 10.50, 20)
  end
end


# ________________________________ #

salaried_employee = SalariedEmployee.new("Jane Doe", 50000)
salaried_employee.print_pay_stub

hourly_employee = HourlyEmployee.new("John Smith", 14.97, 30)
hourly_employee.print_pay_stub

ivan = HourlyEmployee.cashier("Ivan Stokes")

harold= HourlyEmployee.new("Harold Nguyen", 12.75, 25)
tamara = HourlyEmployee.new("Tamara Wells", 12.75, 25)
susie = HourlyEmployee.new("Susie Powell", 12.75, 25)

edwin = HourlyEmployee.janitor("Edwin Burgess")
ethel = HourlyEmployee.new("Ethel Harris", 10.50, 20)

angela = HourlyEmployee.security_guard("Angela Matthews")
stewart = HourlyEmployee.new("Stewart Sanchez", 19.25, 30)

angela.print_pay_stub
edwin.print_pay_stub
ivan.print_pay_stub