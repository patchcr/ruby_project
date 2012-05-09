class ViolationSearch
#require "Table"

=begin
  NEED TO DEFINE CONSTANTS HERE
  TABLE CONSTANTS
  VIOLATION CONSTANTS

=end


	def initiate_scan

		# needed local variable
		array_of_tables = Array.new

		# Directory Scan that yields a file. 
		scan_directories_for_txtfiles {|f| 
			File.open(f)  {|lines|  # using a block here will automatically close the file when we're done
				# Send that file to Table parser
				array_of_tables = table_scan lines
			} #rescue Errno::ENOENT
		}

		# =======================
		# Call violation methods
		#  wait_violation array_of_script_tables
		#  datapool_xpath_violation array_of_datapool_tables
		#  componenet_def_violation array_of_component_tables

	end
	
	def table_scan file
		# Accepts an array of lines and creates tables, returns an array of tables
		# uperhaps we can use collect and get a whole array of tables for that file. 
		scratch_array =  Array.new
		table_a = Array.new
		in_table = false
		puts "NEW FILE".center(50, "=")
		puts file.to_s
		add_a_table_to_array_minimethod_or_lambda = lambda { 
			#puts "The end of a table has happened."
			temptable = Table.new(scratch_array, File.expand_path(file), file.lineno)
			temptable.to_s
			table_a << temptable
			scratch_array = []
		}
		file.lines { |line|
			#print "Made it into the table scan each()"
			#puts line[0]
			#puts line[0,2]
			

			if (line[0] == "|") or (line[0,2] == "!|")
				#head = number
				in_table = true
				#puts line
				scratch_array << line
				#table.to_s 
				#puts "IN a table" + line[0..50]
				add_a_table_to_array_minimethod_or_lambda.call if file.eof?
			else
				#puts "Not in a table" + line[0..50]
				if in_table 
					add_a_table_to_array_minimethod_or_lambda.call
					#puts "The end of a table has happened."
					#temptable = Table.new(table.table, File.expand_path(file), 50)
					#temptable.to_s
					#table_a << temptable
				end 
				in_table = false
			end
								
		} 
		table_a
	end

	def scan_directories_for_txtfiles fitNesseRoot="c:/Users/pryan/Perforce/pryan_PRYANW7/BbAssist/FitNesseRoot", type="all"
		# Accepts a directory and search type, yeilds a file	
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
				raise Exception, "Need regression, component, scenario, all, or none as second argument."
			end
		Dir.chdir(fitNesseRoot + "./LearnMainline/BbLearnTests/") {
			Dir.glob("./**/" + folder + "/**/content.txt") { |f| 
				#puts File.expand_path(f)
				yield f
			}	
		}
		#Dir.glob("**/LearnMainline/BbLearnTests/**/" + folder + "/**/content.txt") {|f| 
		#	puts f
		#	yield f}
	end

end

class Table
	attr_accessor :table, :type, :path, :line_num
	SCRIPT_TABLE = :SCRIPT_TABLE
	COMPONENT_TABLE = :COMPONENT_TABLE
	LF_SCRIPT_TABLE = :LF_SCRIPT_TABLE
	IMPORT_TABLE = :IMPORT_TABLE
	CONTEXT_TABLE = :CONTEXT_TABLE
	DATAPOOL_TABLE = :DATAPOOL_TABLE
	UNDEFINED_TABLE = :UNDEFINED_TABLE
	# contains an array of strings
	# var describing type of Table	
		# need constants defined
	# store the path of the file where the table orginates
	def initialize array_of_lines, path, line_num=0, type=""
		@table = Array.new(array_of_lines) unless array_of_lines == []
		@path = path unless path == ""
		@line_num = line_num
		#puts "before assigning first_line"
		first_line = array_of_lines[0]
		puts "first Line: " + first_line[0..30] #if first_line != nil
		puts "last line:" + array_of_lines[-1][0..30] #unless array_of_lines[-1] == nil
		#puts Kernel.caller

		pretype = case
		when first_line == nil
			"none"
		when (first_line =~ /\!\|script/)
			#puts "script table"
			SCRIPT_TABLE
		when first_line =~ /ComponentDefinitionTable/
			COMPONENT_TABLE
		when first_line[0...7] == "|script" 
			LF_SCRIPT_TABLE
		when first_line =~ /\|import/
			IMPORT_TABLE
		when first_line =~ /\|switch to/
			CONTEXT_TABLE
		when first_line =~ /\!\|DataPool/
			DATAPOOL_TABLE
		else 
			UNDEFINED_TABLE
			#puts "undefined table"
		end
		@type = pretype
		#puts "made it after the case" + @type.to_s
	end
	def add_line line
		if @table == nil
			@table = Array.new(1,line) unless line == nil
		else  
			@table << line
		end
		#puts line
	end
	def to_s
		unless @type == "none"
			puts "TABLE OBJECT DESCRIPTION".center(50, "=")
			print @type.to_s + " table at line " 
			puts @line_num.to_s + " in file " 
			puts @path[-90..-12] unless @path == nil
		end
	end 
end

class GlobalComponentDef_Store
	def add_component comp #accepts array of size 3 ["component", "type", "xpath/id"]
		if comp[1] = "xpath"
			@@list_of_components[comp[0]] = comp[2]
		elsif comp[1] = "id"
			@@list_of_ids[comp[0]] = comp[2]
		else
			raise Exception, "The component def array was not properly formed"
		end
	end

	def initialize 
		@@list_of_components = Hash.new
		@@list_of_ids = Hash.new
	end
end

ViolationSearch.new.initiate_scan

__END__
  What it looks like you're doing here is defining a class Violation that will have subclasses
  of each type of other minor violation. 

  I don't oppose this tactic, but I just wonder what the advantages will be. We could collect different 
  information for each type of violation, but looking at the types of violations out there, really
  all we need is to log its existence (type), location (file), and line number.  Perhaps later we could query
  P4 to see the last person who checked it in and assign an owner/blame to each violation.

  What I don't see is a very big difference in the requirements for a Wait violation as opposed to a
  NoLogMessage violation. 

  -Patrick Ryan 5/4/12

class Violations

	attr_accessor :read_file
	
	@@type_of_violations = ['wait', 'no_logmsg', 'generic']
	@@current_violations = []
	@@total_violations = 0

	initialize method
		@wait = wait
		@no_logmsg = no_logmsg
		@generic = generic
		@@current_violations << self
		@@total_violoations += 1
	
	self.create_with_attributes # TBD arguements
		violation = self.new
		return violation
	
	self.type_of_violations
		@@type_of_violations
		
	self.type_of_violations=(v_array=[])
		@@type_of_violations = v_array
		
	self.current_violations
		@@current_violations
end

class Wait < Violations

	attr_accessor :wait_a
	

class NoLogMsg < Violations

	attr_accessor :no_logmsg_a

class Generic < Violations	

	attr_accessor :generic
