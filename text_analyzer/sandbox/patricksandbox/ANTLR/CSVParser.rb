#!/usr/bin/env ruby
#
# CSV.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: CSV.g
# Generated at: 2012-05-18 18:11:54
# 

# ~~~> start load path setup
this_directory = File.expand_path( File.dirname( __FILE__ ) )
$LOAD_PATH.unshift( this_directory ) unless $LOAD_PATH.include?( this_directory )

antlr_load_failed = proc do
  load_path = $LOAD_PATH.map { |dir| '  - ' << dir }.join( $/ )
  raise LoadError, <<-END.strip!
  
Failed to load the ANTLR3 runtime library (version 1.8.11):

Ensure the library has been installed on your system and is available
on the load path. If rubygems is available on your system, this can
be done with the command:
  
  gem install antlr3

Current load path:
#{ load_path }

  END
end

defined?( ANTLR3 ) or begin
  
  # 1: try to load the ruby antlr3 runtime library from the system path
  require 'antlr3'
  
rescue LoadError
  
  # 2: try to load rubygems if it isn't already loaded
  defined?( Gem ) or begin
    require 'rubygems'
  rescue LoadError
    antlr_load_failed.call
  end
  
  # 3: try to activate the antlr3 gem
  begin
    Gem.activate( 'antlr3', '~> 1.8.11' )
  rescue Gem::LoadError
    antlr_load_failed.call
  end
  
  require 'antlr3'
  
end
# <~~~ end load path setup


module CSV
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :SPACE => 5, :EOF => -1, :T__6 => 6, :NUMBER => 4 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "NUMBER", "SPACE", "'+'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = CSV
    @associated_lexer = 'CSVLexer.rb'

    RULE_METHODS = [ :expression ].freeze


    include TokenData

    begin
      generated_using( "CSV.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )


    end
    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -

    # 
    # parser rule expression
    # 
    # (in CSV.g)
    # 8:1: expression returns [ result ] : a= NUMBER '+' b= NUMBER ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )
      result = nil
      a = nil
      b = nil

      begin
        # at line 9:4: a= NUMBER '+' b= NUMBER
        a = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_expression_28 )
        match( T__6, TOKENS_FOLLOWING_T__6_IN_expression_30 )
        b = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_expression_34 )
        # --> action
         result = a.text.to_i + b.text.to_i 
        # <-- action

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 1 )

      end
      
      return result
    end



    TOKENS_FOLLOWING_NUMBER_IN_expression_28 = Set[ 6 ]
    TOKENS_FOLLOWING_T__6_IN_expression_30 = Set[ 4 ]
    TOKENS_FOLLOWING_NUMBER_IN_expression_34 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

