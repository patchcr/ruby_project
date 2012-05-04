require "FitScan.rb"

def code_violations 

	fitNesseRoot = "/Users/gsypolt/BbAssist/FitNesseRoot/"
	
	scan_directories_for_txtfiles(fitNesseRoot, "regression") { |type_test| 
	temp_file = File.open(type_test) 
	
	
	# file_array = temp_file.each { |line| line.split }
	
    i = 0
    count = 0
    file_array = ""
  
    temp_file.each {|line| 
      i += 1
      temp = line.dup # For debugging 
      j = line =~ /\|script/
    
      if j
        # insert file_array
        puts "First script table found at line: " + i.to_s + " in: " + File.expand_path(type_test)
        puts " "
        # puts temp # for debugging
         
          temp_file.each {|find| 
            temp_c = find.dup
            c = find =~ /log message/
            
            if c 
              count += 1
              puts "Count: " + "#{count}" + " found: " "#{temp_c}"
            end    
          }
          
          
        # logmsg_flag = temp_file.select { |finder| finder =~ /log message/ }
        puts "WARNING - " + "#{count}" + " of occurrences found" 
        # puts "#{logmsg_flag}" 
             
        return
      end
    }       
  }
 end

code_violations