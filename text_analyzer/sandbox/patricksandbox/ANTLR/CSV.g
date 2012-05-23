grammar CSV;

options {
	language=Ruby;
}


expression returns[ result ]
	: a=NUMBER '+' b=NUMBER { $result = $a.text.to_i + $b.text.to_i }
	;
NUMBER	:	('0' .. '9' )+;


/** Rules */

rowbegin : NEWLINE PIPE {
	

};

tablebegin: ~PIPE NEWLINE PIPE
tableend: PIPE NEWLINE ~PIPE





/** Lexer */
ROWEND : PIPE NEWLINE
fragment
NEWLINE : '\n' ;

fragment
ANYTHING : .* ;

TEXT : ('a'..'z'|'A'..'Z'|'0'..'9'|'_'|' '|'#'|'$'|'('|')')+ ;

SPACE :  ' ';
LONGSPACE : ' '+;

PIPE : '|' ;