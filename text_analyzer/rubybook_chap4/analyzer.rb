# Chapter 4 Exercise

def example1
	text=''
	line_count = 0
	file_name = "oliver.txt"

	File.open(file_name).each do |line| 
		line_count += 1 
		text << line
	end 

	puts "#{line_count} lines"
end

def example2
	# Variables
	file_name1 = "oliver.txt"
	file_name2 = "content.txt"
	
	
	lines = File.readlines(file_name1)
	line_count = lines.size 
	text = lines.join #Total Lines
	total_characters = text.length # Total Characters
	total_characters_nospaces = text.gsub(/\s+/, '').length # Total Characters Excluding Spaces
	word_count = text.split.length # Counting Words
	paragraph_count = text.split(/\n\n/).length # Paragraph Count
	sentence_count = text.split(/\.|\?|!/).length # Sentence Count
						
	# Puts (Terminal Output)	
	puts "#{line_count} lines"
	puts "#{total_characters} characters"
	puts "#{total_characters_nospaces} characters excluding spaces"
	puts "#{word_count} words"
	puts "#{paragraph_count} paragraphs"
	puts "#{sentence_count} sentences"
	puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
	puts "#{word_count / sentence_count} words per sentence (average)"
	
	# Adding Extra Features
	stopwords = %w{the a by on for of are with just but and to the my I has some in}
end

def example3
	text = %q{Los Angeles has some of the nicest weather in the country.}
	stopwords = %w{the a by on for of are with just but and to the my in I has some}
	
	words = text.scan(/\w+/)
	keywords = words.select { |word| !stopwords.include?(word) }
	stopwords_percentage = ((keywords.length.to_f / words.length.to_f) *100).to_i
	
	puts keywords.join(' ')
	puts "#{stopwords_percentage}% of non-stop words"
end

# Execute Method
example3