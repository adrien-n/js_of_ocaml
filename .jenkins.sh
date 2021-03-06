opam update
#opam pin add jbuilder https://github.com/janestreet/jbuilder.git

opam pin add --no-action js_of_ocaml .
opam pin add --no-action js_of_ocaml-compiler .
opam pin add --no-action js_of_ocaml-ocamlbuild .
opam pin add --no-action js_of_ocaml-camlp4 .
opam pin add --no-action js_of_ocaml-ppx .
opam pin add --no-action js_of_ocaml-lwt .
opam pin add --no-action js_of_ocaml-tyxml .
opam pin add --no-action js_of_ocaml-toplevel .

#opam pin add ocaml-migrate-parsetree https://github.com/let-def/ocaml-migrate-parsetree.git
#opam pin add ppx_tools_versioned https://github.com/let-def/ppx_tools_versioned.git

opam install ppx_tools_versioned reactiveData cppo base64

opam install tyxml || true
opam install deriving || true

# opam install async_kernel.113.33.00 || true
# opam install ppx_driver.113.33.04 || true

# case $(opam switch show) in
#     4.03*) opam pin add lwt https://github.com/Drup/lwt.git#4.03.0-no-oasis ;;
#     *) ;;
# esac

opam pin add lwt https://github.com/ocsigen/lwt.git#pull/322/head

opam install --deps-only js_of_ocaml js_of_ocaml-lwt js_of_ocaml-compiler js_of_ocaml-ocamlbuild js_of_ocaml-camlp4 js_of_ocaml-toplevel js_of_ocaml-ppx js_of_ocaml-tyxml

opam install --verbose js_of_ocaml-compiler
opam install --verbose js_of_ocaml-ocamlbuild
opam install --verbose js_of_ocaml-camlp4
opam install --verbose js_of_ocaml
opam install --verbose js_of_ocaml-ppx
opam install --verbose js_of_ocaml-lwt
opam install --verbose js_of_ocaml-tyxml
opam install --verbose js_of_ocaml-toplevel

do_build_doc () {
  opam install ocp-indent cppo higlo base64
  make clean
  make all
  make -C doc doc
  make -C doc wikidoc
  cp -Rf doc/manual/files/* ${MANUAL_FILES_DIR}/
  cp -Rf doc/manual/src/* ${MANUAL_SRC_DIR}/
  cp -Rf doc/api/wiki/*.wiki ${API_DIR}/
}

do_remove () {
  opam remove --verbose js_of_ocaml js_of_ocaml-compiler js_of_ocaml-ocamlbuild js_of_ocaml-camlp4 js_of_ocaml-ppx js_of_ocaml-toplevel js_of_ocaml-lwt js_of_ocaml-tyxml
}
