# search file text for a pattern and replace it with a given value

#This is just testing out how we should import modules and use the classes

# require_relative "FitScan"
# include FitScan
# temp = FitScan::ComponentDef.new("//div")

def code_violations

	files = Dir.glob("./*.txt")
	
	files.each do |file_name| 
		text = File.readlines(file_name) 
    wait_flag = text.select { |finder| finder =~ /wait/ }
		  
		puts "DIRECTORY - #{Dir.pwd}"		
	  puts "WARNING - # of occurances found" 
	  puts "#{wait_flag}" 
	end
end

code_violations