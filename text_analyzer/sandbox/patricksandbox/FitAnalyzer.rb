module FitAnalyzer
  require 'Parser'
  
  def command_line_interface
    # Read ARGV for options
    fit_analyzer # with any valid arguments
  end
  
  def fit_analyzer #accepts valid settings not yet implemented
    parser = Parser.new
    file_search { |file|
      open_file = File.open file
      parser.parse open_file
      open_file.close
    }
  end
  
  def file_search
    # Code already written to find files
    # From here we should be passing each file to the parser
    
  end
end

# Execution for the entire program begins here:
command_line_interface