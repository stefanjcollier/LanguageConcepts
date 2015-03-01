
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
