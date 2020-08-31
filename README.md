Building with distutils
-----------------------

```bash
python3 setup.py build_ext
python3 setup.py install --install-platlib=.
```

Building manually
-----------------

#Generate swig interface with:

```bash
swig -python -c++ -Isrc ukf.i
```

#Look at generated wrapper in ukf_wrap.c


#Compile with:

```bash
g++ -Isrc -fPIC -c $(pkg-config --cflags --libs python3)\
         tools.cpp ukf.cpp ukf_wrap.cxx
g++ -shared -o _ukf.so Tools.o UKF.o ukf_wrap.o
```
