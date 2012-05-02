# search file text for a pattern and replace it with a given value

#This is just testing out how we should import modules and use the classes
require_relative "FitScan"
include FitScan
temp = FitScan::ComponentDef.new("//div")

def matching

	# First set the files to search/replace in
<<<<<<< HEAD
	files = Dir.glob("./*.txt")
=======
	files = Dir.glob("/Users/gsypolt/github/ruby_project/text_analyzer/fit_analyzer/*.txt*")
>>>>>>> 22b6c5f9cd67220f13042b6027d37af668945fd6

	# Then set the variables for find/replace
	@string_regex = /script/
	@replacement_string = "STRING"
	
	files.each do |file_name|
		text = File.read(file_name)

		# match_text = text.scan(@string_regex)
		# puts match_text
		scanner = text.select { |finder| finder =~ /script/ } 
		puts scanner 
	end
end

matching