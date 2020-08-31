from distutils.core import setup, Extension

name = "ukf"    # name of the module
version = "1.0"        # the module's version number

setup(name=name, version=version,
      # distutils detects .i files and compiles them automatically
      ext_modules=[Extension(name='_ukf', # SWIG requires _ as a prefix for the module name
                             sources=["ukf.i", "ukf.cpp", "tools.cpp"],
                             include_dirs=['src'],
                             swig_opts=["-c++"]
                             #,extra_compile_args=['-std=c++11']
                             )
    ])
