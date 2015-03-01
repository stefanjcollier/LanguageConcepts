/* File parser.mly */
%{
    let con x y = x^y
%}

%token <string> WORD
%token CONCAT EXP_END
%left CONCAT
%start main
%type <string> main
%%

main: prog { $1 }
;

prog: expr end { $1 }
;

end :
| EXP_END | EOL | end end {}
;

expr: WORD { $1 }
| expr CONCAT expr { $1^$3 }
;
