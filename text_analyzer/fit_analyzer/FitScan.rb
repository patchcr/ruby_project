module FitScan

class ComponentDef
	attr_accessor :xpath

	def initialize xpath
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
