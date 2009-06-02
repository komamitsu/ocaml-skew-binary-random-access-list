OCAMLC=ocamlc
OCAMLOPT=ocamlopt
OCAMLDEP=ocamldep
OCAMLFLAGS=
OCAMLOPTFLAGS=
RM=rm -f
MODULE=skewBinaryRandomAccessList

.SUFFIXES: .mli .cmi .ml .cmo .cmx

.mli.cmi:
	$(OCAMLC) -c $<

.ml.cmo:
	$(OCAMLC) -c $<

.ml.cmx:
	$(OCAMLOPT) -c $<

all: bytecode nativecode

bytecode: $(MODULE).cmi $(MODULE).cmo

nativecode: $(MODULE).cmi $(MODULE).cmx

clean:
	$(RM) $(MODULE).cm* $(MODULE).o

