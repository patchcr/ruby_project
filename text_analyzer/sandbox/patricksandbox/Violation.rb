class Violation
  attr_accessors :count, :instance, :path, :type
  
  def initialize type path 
    @type = type
    @path = path
    @instance = []
  end
  def add_v line_num
    @instance << line_num
  end
end