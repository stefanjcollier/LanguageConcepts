
all:
	ocamlc -c Path.ml
	ocamllex Lexer.mll
	ocamlyacc Parser.mly
	ocamlc -c Parser.mli
	ocamlc -c Lexer.ml
	ocamlc -c Parser.ml
	ocamllex inputlexer.mll
	ocamlyacc inputparser.mly
	ocamlc -c inputparser.mli
	ocamlc -c inputlexer.ml
	ocamlc -c inputparser.ml
	ocamlc -c love.ml
	ocamlc -o love inputlexer.cmo inputparser.cmo Lexer.cmo Parser.cmo Path.cmo love.cmo

clean:
	rm love *.cmo Lexer.ml Parser.ml Parser.mli *.cmi inputlexer.ml inputparser.ml inputparser.mli
