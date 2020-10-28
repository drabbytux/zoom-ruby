class Employee

  attr_reader :name

  def initialize (name = "Anonymous")
    self.name = name
  end

  def name=(name)
    # code to validate
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
    if salary >= 0
      @salary = salary
    else
      raise "No salary set"
    end
  end

  def print_pay_stub
    print_name
    pay_for_period = (salary / 365.0) * 14
    formatted_pay = format("$%.2f", pay_for_period)
    puts "Pay This Period: #{formatted_pay}"
  end
end

class HourlyEmplyee < Employee

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

  def turn_into_cashier
      self.hourly_wage = 12.75
      self.hours_per_week = 25
  end
end


# ________________________________ #

salaried_employee = SalariedEmployee.new("Jane Doe", 50000)
salaried_employee.print_pay_stub

hourly_employee = HourlyEmplyee.new("John Smith", 14.97, 30)
hourly_employee.print_pay_stub

ivan = HourlyEmplyee.new("Ivan Stokes")
ivan.turn_into_cashier
ivan.print_pay_stub

harold= HourlyEmplyee.new("Harold Nguyen", 12.75, 25)
tamara = HourlyEmplyee.new("Tamara Wells", 12.75, 25)
susie = HourlyEmplyee.new("Susie Powell", 12.75, 25)

edwin = HourlyEmplyee.new("Edwin Burgess", 10.50, 20)
ethel = HourlyEmplyee.new("Ethel Harris", 10.50, 20)

angela = HourlyEmplyee.new("Angela Matthews", 19.25, 30)
stewart = HourlyEmplyee.new("Stewart Sanchez", 19.25, 30)
