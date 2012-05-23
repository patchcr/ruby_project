# encoding: utf-8

$:.unshift( File.dirname( __FILE__ ) )
require 'CSVLexer'
require 'CSVParser'
#require 'CSVWalker'

def starting
for file in ARGV
  input = ANTLR3::FileStream.new( file )
  parser = CSV::Parser.new( input )
  #tree = parser.program.tree
  #puts( "tree: #{ tree.inspect }" )
  #nodes = ANTLR3::AST::CommonTreeNodeStream.new(
  #  tree, :token_stream => parser.input
  #)
  #SimpleCWalker::TreeParser.new( nodes ).program
end
end

def testNewline
	lex = CSV::Lexer.new("\n")
	parsed = CSV::Parser.new(lex)
	#parsed.line
	list = lex.methods
	o = Object.methods
	z = list - o
	
	(list - parsed.methods).sort
end

def testCRLF
	parsed = CSV::Lexer.new("\r\n")
	parsed.line
end

def createParser
	input = ANTLR3::FileStream.new(ARGV[0])
	lexer = CSV::Lexer.new(input)
	tokens = ANTLR3::CommonTokenStream.new(lexer)
	parsed = CSV::Parser.new(tokens)
	parsed
end

puts testCRLF
puts "++++++++++++"
puts testNewline
puts "++++++++++++"
#puts createParser