def fit_read_file
	
	file_name = "content.txt"

	File.open(file_name).each { |line| puts line }
end

def wiki_parser
	file_name = "content.txt"

	File.open(file_name).each do |space_striper|
		text = space_striper
		readable_file = text.gsub(/\s+/, ' ').strip.split 
		puts readable_file
	end
end

# Execute Method
wiki_parser