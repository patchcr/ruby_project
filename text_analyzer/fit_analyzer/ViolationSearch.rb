class ViolationSearch

require "FitScan"
import "FitScan"
import "Table"

	def initiate_scan

		# needed local variable
		array_of_tables = Array.new

		# Directory Scan that yields a file. 
		scan_directories_for_txtfiles {|f| 
			File.open(f) {|lines|  # using a block here will automatically close the file when we're done
				# Send that file to Table parser
				array_of_tables = table_scan lines
			}
		}
		# =======================
		# Call violation methods
		#  wait_violation array_of_script_tables
		#  datapool_xpath_violation array_of_datapool_tables
		#  componenet_def_violation array_of_component_tables

	end
	
	def table_scan file
		# Accepts an array of lines and creates tables, returns an array of tables
		table = ""
		table_a = []
		file.each_with_index do |line, number|
			if line[0] = "|"
				head = number
				begin
					table << line
					file.next
				end until line[0] != "|"
				table_a << Table.new(table, File.expand_path(file), head)
				table = ""
			end
		end
		table_a
	end

	def scan_directories_for_txtfiles fitNesseRoot, type="all"
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
				raise Exception, "Need regression, component, scenario, all or none as second argument."
			end
		Dir.glob("**/LearnMainline/BbLearnTests/**/" + folder + "/**/content.txt") {|f| yield f}
	end

end

class Table
	attr_accessor :@table, :@type, :@path, :line_num
	# contains an array of strings
	# var describing type of Table	
		# need constants defined
	# store the path of the file where the table orginates
	def initialize array_of_lines path line_num
		@table = array_of_lines
		@path = path
		@line_num = line_num
		first_line = array_of_lines[1]
		@type = case first_line
		when =~ /\!\|script/
			SCRIPT_TABLE
		when =~ /ComponentDefinitionTable/
			COMPONENT_TABLE
		when firstline[0...7] = "|script"
			LF_SCRIPT_TABLE
		when =~ /\|import/
			IMPORT_TABLE
		when =~ /\|switch to/
			CONTEXT_TABLE
		when =~ /\!\|DataPool/
			DATAPOOL_TABLE
		else 
			UNDEFINED_TABLE
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