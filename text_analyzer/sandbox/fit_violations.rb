require "FitScan.rb"

def wait_violations 

	fitNesseRoot = "/Users/gsypolt/BbAssist/FitNesseRoot/"
	
	scan_directories_for_txtfiles(fitNesseRoot, "regression") { |type_test| 
	vfile = File.open(type_test) 
	
  i = 0
  count = 0
  
  total_count = ""
  total_count_a =[]

  vfile.each {|line| 
    i += 1
    check_violation = line =~ /wait/
    
    if check_violation

      
      puts "LOCATION: " + i.to_s + " in: " + File.expand_path(type_test)
      puts "LINE: " + i.to_s
      puts "#{count}" + "- of wait violations found on this file" 
    end
  }
 }
 end

wait_violations