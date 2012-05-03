require "FitScan.rb"

def code_violations 

	fitNesseRoot = "/Users/gsypolt/BbAssist/FitNesseRoot/"
	
	scan_directories_for_txtfiles(fitNesseRoot, "regression") { |type_test| 
	temp_file = File.open(type_test) 
	
	
	# file_array = temp_file.each { |line| line.split }
	
  i = 0
  k = ""
  temp_file.each {|line| 
    i += 1
    temp = line.dup # For debugging 
    j = line =~ /\|script/
    
    if j
      # insert file_array
      wait_flag = temp_file.select { |finder| finder =~ /wait/ }
      puts "First script table found at line: " + i.to_s + " in: " + File.expand_path(type_test)
      puts "WARNING - # of occurances found" 
      puts "#{wait_flag}" 
      return
    end
  }
 }
 end

code_violations