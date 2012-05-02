module FitScan

class ComponentDef
	attr_accessor :xpath, :comdef, :id

	def initialize line
		@array_of_cells = line.split("|")
		@xpath = xpath
	end
end

class FixtureCall
	attr_accessor :method_name

	def initialize line
		@line_of_text = line
		#scan for Pipes and put into an array
		@array_of_cells = line.split("|")
	end
end
end

#greg to search for tables and categorizing them.

#patrick to write directory traversal.
def scan_directories_for_txtfiles fitNesseRoot, type="all"
	
	folder = case type
		when "regression"
			"RegressionSuite"
		when "scenario"
			"ScenarioLib"
		when "component"
			"*Components"
		when "all"
			"**"
		else
			raise Exception, "Need regression, component, scenario, all or none as an argument."
		end

	# Putting the Dir.glob search in a block will return the working directory
	# to it's original location - important for loading new classes and modules.
	Dir.chdir(fitNesseRoot + "./LearnMainline/BbLearnTests/") {
		Dir.glob("./**/" + folder + "/**/content.txt") { |f| 
			#puts File.expand_path(f)
			yield File.expand_path(f) #Can remove this and return an array instead. 
		}	
	}

	# We also have the ability to pass this up as an array of files. I can't decide if holding an array
	# is better than keeping the search open and yeilding one file at a time. 
end

def match file
	i = 0
	file.each {|line|
		i += 1
		temp = line.dup
		j = line =~ /\|script/
		if j
			puts "First script table found at line: " + i.to_s + " in: " + File.expand_path(file)
			puts temp
			return
		end
	}
end


fitNesseRoot = "c:/Users/pryan/Perforce/pryan_PRYANW7/BbAssist/FitNesseRoot"
scan_directories_for_txtfiles(fitNesseRoot, "regression") {|f|
	match File.open(f, "r")  rescue Errno::ENOENT # Open for Reading only
	


}