module FitAnalyzer
  $LOAD_PATH.unshift File.dirname($PROGRAM_NAME)
  require 'Parser'
  
  def command_line_interface
    # TODO: Read ARGV for options
    default_root="c:/Users/pryan/Perforce/pryan_PRYANW7/BbAssist/FitNesseRoot"
    search_type = "all"
    fit_analyzer default_root, search_type 
  end
  
  def fit_analyzer root, search 
    parser = Parser.new
    file_search(root,search) { |file|
      open_file = File.open file
      parser.parse open_file
      open_file.close
    }
  end
  
  def file_search fitNesseRoot, type
    folder = case type
      when "regression"
        "RegressionSuite"
      when "scenario"
        "ScenarioLib"
      when "component"
        "*Components"
      when "all"
        "**"
      else
        raise Exception, "Need regression, component, scenario, all, or none as second argument."
      end
    Dir.chdir(fitNesseRoot + "./LearnMainline/BbLearnTests/") {
      Dir.glob("./**/" + folder + "/**/content.txt") { |f| 
        #puts File.expand_path(f)
        yield f
      } 
    }
  end
end

include FitAnalyzer
# Execution for the entire program begins here:
command_line_interface