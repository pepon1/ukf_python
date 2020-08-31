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
swig -python -c++ -Isrc helloworld.i
```

#Look at generated wrapper in hw_wrap.c


#Compile with:

```bash
g++ -Isrc -fPIC -c $(pkg-config --cflags --libs python3)\
         src/HelloWorld.cpp src/HelloWorld2.cpp helloworld_wrap.cxx
g++ -shared -o _helloworld.so HelloWorld.o HelloWorld2.o helloworld_wrap.o
```
