require "FitScan.rb"

def wait_violations 

	fitNesseRoot = "/Users/gsypolt/BbAssist/FitNesseRoot/"
	
	scan_directories_for_txtfiles(fitNesseRoot, "regression") { |type_test| 
	vfile = File.open(type_test) 
	
  i = 0
  count = 0
  
  total_count = ""
  total_count_a =[]

  vfile.each do |line| 
    i += 1
    check_violation = line =~ /wait/
    
    if check_violation

      count += 1
      
      puts "LOCATION: "  + File.expand_path(type_test)
      puts "#{count}" + " - of wait violations found on this file" 
      puts  " --------------------------- "
      
      # store this information inside text file
      # type of search; all, regression, scenario, components
      # display the violation line number
      # total files found 1 more more violation
      # total violations across directories 
      
    end
  end
  vfile.close
 }
 end

# Execution
wait_violations