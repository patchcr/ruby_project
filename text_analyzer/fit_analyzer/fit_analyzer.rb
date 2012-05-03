def fit_read_file
	
	file_name = "content.txt"

	File.open(file_name).each { |line| puts line }
end

def wiki_parser
	file_name = "content.txt"

	file_name.each do |space_striper|
		text = File.read(file_name)
		# readable_file = text.gsub(/\s+/, ' ').strip.split
		readable_file = text.split(/\s+/).inspect # textual represnetation of the object and output shows the result inside an array 

		puts readable_file
	end
end

# Execute Method
wiki_parser