
all:
	ocamlc -c Path.ml
	ocamllex Lexer.mll
	ocamlyacc Parser.mly
	ocamlc -c Parser.mli
	ocamlc -c Lexer.ml
	ocamlc -c Parser.ml
	ocamlc -c love.ml
	ocamlc -o love Lexer.cmo Parser.cmo Path.cmo  love.cmo

clean:
	rm love *.cmo Lexer.ml Parser.ml Parser.mli *.cmi
