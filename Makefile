.SUFFIXES : .mli .cmi .ml .cmo

.mli.cmi :
	ocamlc $<

.ml.cmo :
	ocamlc -c $<

all : skewBinaryRandomAccessList.cmi skewBinaryRandomAccessList.cmo
