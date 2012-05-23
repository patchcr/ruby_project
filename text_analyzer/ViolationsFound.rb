require "FitScan.rb"

def initialize_scan
  @total_count = 0
  @total_files = 0
  @time = Time.new
end

def wait_violations 

	fitNesseRoot = "/Users/gsypolt/BbAssist/FitNesseRoot/"
	
	scan_directories_for_txtfiles(fitNesseRoot, "scenario") { |type_test| 
	vfile = File.open(type_test) 
	
  i = 0
  count = 0
  count_file = 0
  

  vfile.each do |line| 
    i += 1
    check_violation = line =~ /wait/
    
    if check_violation

      count += 1
      
      puts "LOCATION: "  + File.expand_path(type_test)
      puts "#{count}" + " - of wait violations found on this file" 
      puts " "
      
      # store this information inside text file
      # type of search; all, regression, scenario, components
      # display the violation line number
      # total files found 1 more more violation
      # total violations across scan directories   
    end
      
  end
  @total_count += count
  vfile.close
 }
 end

def violation_report
  puts " ----- WAIT VIOLATIOIN REPORT ----- "
  puts "Scan Time: " + @time.inspect
  puts " "
  puts "Total Violation: " + "#{@total_count}"
  puts "Total Files With Violations: " + "#{@total_files}"
end 

# Execution
initialize_scan
wait_violations
violation_report