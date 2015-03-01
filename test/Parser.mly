/* File parser.mly */
%{
	type results = 
	  | Word of string
	  | MoreWords of (results * results)
	  ;;
;;


%}

%token <string> WORD
%token CONCAT EXP_END EOL PROG_END
%left CONCAT
%start main
%type <string> main
%%

main: prog PROG_END EOL { $1 }
;

prog:  
| wordExpr EXP_END EOL { $1 }
| wordExpr EXP_END EOL prog { $1 ^"\n" ^ $4 }
| wordExpr EXP_END prog { $1 ^"\n" ^ $3 }

wordExpr: 
| WORD { $1 }
| wordExpr CONCAT wordExpr { $1^$3 }
;
