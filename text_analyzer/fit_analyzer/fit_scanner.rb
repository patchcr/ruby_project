# search file text for a pattern and replace it with a given value

#This is just testing out how we should import modules and use the classes
require_relative "FitScan"
include FitScan
temp = FitScan::ComponentDef.new("//div")

def matching

	# First set the files to search/replace in
	files = Dir.glob("./*.txt")

	# Then set the variables for find/replace
	@string_regex = /script/
	@replacement_string = "STRING"
	
	files.each do |file_name|
		text = File.read(file_name)

		match_text = text.scan(@string_regex)
		puts match_text 
	end
end

matching