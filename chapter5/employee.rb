class Payroll
  def update(changed_employee)
    puts "#{changed_employee.name}のために小切手を切ります！"
    puts "彼の給料はいま#{changed_employee.salary}です！"
  end
end

class TaxMan
  def update(changed_employee)
    puts "#{changed_employee.name}に新しい税金の請求書を送ります！"
  end
end

class Employee
  attr_reader :name
  attr_reader :title, :salary

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @observers = []
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end
end

fred = Employee.new('Fred', 'Crane Operator', 30000.0)

payroll = Payroll.new
fred.add_observer payroll
tax_man = TaxMan.new
fred.add_observer tax_man

fred.salary = 35000.0
