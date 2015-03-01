<<<<<<< HEAD

all:
	ocamllex lexer.mll       # generates lexer.ml
	ocamlyacc parser.mly     # generates parser.ml and parser.mli
	ocamlc -c myTypes.mli
	ocamlc -c myTypes.ml
	ocamlc -c parser.mli
	ocamlc -c lexer.ml
	ocamlc -c parser.ml
	#ocamlc -c myClasses.ml
	#ocamlc -c mysplinterpreter.ml
	#ocamlc -o mysplinterpreter lexer.cmo parser.cmo myTypes.cmo str.cma myClasses.cmo mysplinterpreter.cmo

clean:
	rm sdlc *.cmo lexer.ml parser.ml parser.mli *.cmi
=======
ocamlc -c Path.ml 
ocamllex Lexer.mll
ocamlyacc Parser.mly
ocamlc -c Parser.mli
ocamlc -c Lexer.ml
ocamlc -c Parser.ml
ocamlc -c love.ml
ocamlc -o love Lexer.cmo Parser.cmo love.cmo Path.cmo
>>>>>>> 6fa221a725696cf60c78d7bb34f10f6c943dd5f6
