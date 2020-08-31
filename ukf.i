%module ukf

%{
#   define SWIG_PYTHON_EXTRA_NATIVE_CONTAINERS 
#include "measurement_package.h"
#include "tools.h"
#include "ukf.h"
%}

// In pop()
%typemap(out) std::vector<std::vector<ns::uint64_t> >::value_type { 
$result = SWIG_NewPointerObj(SWIG_as_voidptr(&$1), $descriptor(std::vector<ns::uint64_t>), 0 |  0 ); 
} 

// In front(), back(), __getitem__()
%typemap(out) std::vector<std::vector<ns::uint64_t> >::value_type & { 
    $result = SWIG_NewPointerObj(SWIG_as_voidptr($1), $descriptor(std::vector<ns::uint64_t>), 0 |  0 ); 
} 
// In __getitem__()
%typemap(out) ns::uint64_t {
    $result = PyLong_FromUnsignedLongLong($1);
}
// Not used (but probably useful to have, just in case)
%typemap(in) ns::uint64_t {
    $1 = PyLong_AsUnsignedLongLong($input);
}
// In pop()
%typemap(out) std::vector<ns::uint64_t>::value_type {
    $result = PyLong_FromUnsignedLongLong($1);
}
// In __getitem__(), front(), back()
%typemap(out) std::vector<ns::uint64_t>::value_type & {
    $result = PyLong_FromUnsignedLongLong(*$1);
}
// In __setitem__(), append(), new Uint64Vector, push_back(), assign(), resize(), insert()
// This allows a python long literal number to be used as a parameter to the above methods. 
// Note the use of a local variable declared at the SWIG wrapper function scope,
// by placing the variable declaration in parentheses () prior to the open brace {
%typemap(in) std::vector<ns::uint64_t>::value_type & (std::vector<ns::uint64_t>::value_type temp) {
    temp = PyLong_AsUnsignedLongLong($input);
    $1 = &temp;
}

%include "std_string.i"
%include "std_vector.i"
%include "typemaps.i"
%include "std_map.i"


%include "measurement_package.h"
%include "tools.h"
%include "ukf.h"
