require "FitScan.rb"

def initialize_scan
  @total_count = 0
  @total_files = 0
end

def wait_violations 

	fitNesseRoot = "/Users/gsypolt/BbAssist/FitNesseRoot/"
	
	scan_directories_for_txtfiles(fitNesseRoot, "regression") { |type_test| 
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
      # total violations across directories   
    end
    
    if count >= 1
      count_file += 1
    end
      
  end
  @total_count += count
  @total_files += count_file
  vfile.close
 }
 end

def violation_report
  puts " ----- VIOLATIOIN REPORT ----- "
  puts "TOTAL WAIT VIOLATION: " + "#{@total_count}"
  puts "TOTAL FILES WITH VIOLATION: " + "#{@total_files}"
end 

# Execution
initialize_scan
wait_violations
violation_report