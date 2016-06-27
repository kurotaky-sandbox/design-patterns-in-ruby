class Task
  attr_reader :name, :parent

  def initialize(name)
    @name = name
    @parent = nil
  end

  def get_time_required
    0.0
  end
end
