require_relative 'task'

class AddDryIngredientsTask < Task
  def initialize
    super('Add dry ingedients')
  end

  def get_time_required
    1.0 # 小麦粉と砂糖を加えるのに1分
  end
end

class MixTask < Task
  def initialize
    super('Mix that batter up')
  end

  def get_time_required
    3.0 # 混ぜるのに3分
  end
end

class MakeBatterTask < CompositeTaks
  def initialize
    super('Make batter')
    add_sub_task(AddDryIngredientsTask.new)
    add_sub_task(AddLiquidsTask.new)
    add_sub_task(MixTask.new)
  end
end

class CompositeTaks < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def <<(task)
    @sub_tasks << task
  end

  def [](index)
    @sub_tasks[index]
  end

  def []=(index, new_value)
    @sub_tasks[index] = new_value
  end

  def add_sub_task(task)
    @sub_tasks << task
    task.parent = self
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def get_time_required
    time=0.0
    @sub_tasks.each {|task| time += task.get_time_required}
    time
  end
end
