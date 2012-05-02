# search file text for a pattern and replace it with a given value

#This is just testing out how we should import modules and use the classes

# require_relative "FitScan"
# include FitScan
# temp = FitScan::ComponentDef.new("//div")

def matching

	files = Dir.glob("./*.txt")

	@string_regex = /script/ # instance variables 
	
	files.each do |file_name| 
		text = File.readlines(file_name) 

		scanner = text.select { |finder| finder =~ /script/ } 
		
		puts Dir.pwd		
		puts "#{scanner}" 
	end
end

matching