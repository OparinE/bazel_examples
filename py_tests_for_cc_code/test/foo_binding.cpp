#include "src/foo.h"
#include <pybind11/pybind11.h>

namespace py = pybind11;

PYBIND11_MODULE(libfoo_binding_bin, m){
    m.doc() = "Foo python binding";
    m.def("foo", &foo, "foo() sums arguments");
}
