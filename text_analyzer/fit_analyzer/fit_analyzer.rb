def fit_read_file
	
	file_name = "content.txt"

	File.open(file_name).each { |line| puts line }
end

def wiki_parser
	file_name = "content.txt"
<<<<<<< HEAD

	File.open(file_name).each do |space_striper|
		text = space_striper
		readable_file = text.gsub(/\s+/, ' ').strip.split 
=======
	
	file_name.each do |space_striper|
		text = File.read(file_name)
		# readable_file = text.gsub(/\s+/, ' ').strip.split
		readable_file = text.split(/\s+/).inspect # textual represnetation of the object and output shows the result inside an array 
>>>>>>> comment my version
		puts readable_file
	end
end

# Execute Method
wiki_parser