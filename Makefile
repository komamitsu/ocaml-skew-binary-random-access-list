OCAMLC=ocamlc
OCAMLOPT=ocamlopt
OCAMLDEP=ocamldep
OCAMLFLAGS=
OCAMLOPTFLAGS=
RM=rm -f
MODULE=skewBinaryRandomAccessList
TEST=test

.SUFFIXES: .mli .cmi .ml .cmo .cmx

.mli.cmi:
	$(OCAMLC) -c $<

.ml.cmo:
	$(OCAMLC) -c $<

.ml.cmx:
	$(OCAMLOPT) -c $<

all: bytecode nativecode test_bytecode test_nativecode

bytecode: $(MODULE).cmi $(MODULE).cmo

nativecode: $(MODULE).cmi $(MODULE).cmx

test_bytecode:
	$(OCAMLC) -o $(TEST).byte $(MODULE).cmo $(TEST).ml
	./$(TEST).byte
	$(RM) $(TEST).byte

test_nativecode:
	$(OCAMLOPT) -o $(TEST).native $(MODULE).cmx $(TEST).ml
	./$(TEST).native
	$(RM) $(TEST).native

clean:
	$(RM) $(MODULE).cm* $(MODULE).o $(TEST).byte $(TEST).native $(TEST).cm* $(TEST).o

