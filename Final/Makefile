
all:
	ocamlc -c str.cma path.ml
	ocamllex lexer.mll
	ocamlyacc parser.mly
	ocamlc -c parser.mli
	ocamlc -c lexer.ml
	ocamlc -c parser.ml
	ocamllex inputlexer.mll
	ocamlyacc inputparser.mly
	ocamlc -c inputparser.mli
	ocamlc -c inputlexer.ml
	ocamlc -c inputparser.ml
	ocamlc -c love.ml
	ocamlc -o mysplinterpreter inputlexer.cmo inputparser.cmo lexer.cmo parser.cmo str.cma path.cmo love.cmo

clean:
	rm mysplinterpreter *.cmo lexer.ml parser.ml parser.mli *.cmi inputlexer.ml inputparser.ml inputparser.mli 
