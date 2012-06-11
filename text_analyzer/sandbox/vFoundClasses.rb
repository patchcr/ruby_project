class ViolationRules
	
	@total_count = 0
	@total_files = 0
	@time = Time.new
	
	attr_accessor :fitNesseRoot
	
	def initialize(fitNesseRoot)
		@fitNesseRoot = fitNesseRoot # "/Users/gsypolt/BbAssist/FitNesseRoot/"
	end 

		
end

class WaitRule < ViolationRules
	def rule
		violation_rule = /wait/
	end

end

class NoLogMsgRule < ViolationRules
	
end

class XpathDatapoolRule < ViolationRules

end

rule1 = ViolationRules.new("/Users/gsypolt/BbAssist/FitNesseRoot/")
puts rule1