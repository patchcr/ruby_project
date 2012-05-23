class Violation
  attr_accessor :count, :instance, :path, :type
  
  def initialize type, path 
    @type = type
    @path = path
    @instance = []
  end
  def add_v line_num
    @instance << line_num
  end
  def to_s
    return @count + " number of " + @type + " violations in " + @path[-90..-12]
  end
end