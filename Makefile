.SUFFIXES : .mli .cmi .ml .cmo

.mli.cmi :
	ocamlc $<

.ml.cmo :
	ocamlc -c $<

MODULE=skewBinaryRandomAccessList

all : ${MODULE}.cmi ${MODULE}.cmo

clean :
	rm -f ${MODULE}.cmi ${MODULE}.cmo

