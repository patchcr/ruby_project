class Parser
  # Defines the parse method which will accept an open file.
  # At this time it will create tables from the files.
  # Once a table is complete, parse will create a Table Context object
  # and send that to the Table Strategy object. 
  require 'Strategy.rb'
  require 'Context.rb'
  def initialize
    # Initializing the parser object
  end
  
  def parse file
    in_table = false
    scratch = Array.new
    table_a = Array.new
    
    file.lines { |line|
      if (line[0] == "|") or (line[0,2] == "!|")
        in_table = true
        scratch << line
      else
        if in_table
          # Create Table Context object
          context = TableContext.new(scratch)
          context.line_num = file.lineno
          context.path = File.expand_path(file)
          strategy = Strategy.new(context)
          violations = strategy.check
          puts violations
        end
      end
    }
  end
 
end