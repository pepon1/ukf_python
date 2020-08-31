FROM debian

RUN apt-get update
RUN apt-get install -y build-essential libpcre3-dev libboost-dev autoconf automake libtool bison git
RUN apt-get install -y python3-dev 2to3
RUN apt-get install -y wget mc nano
RUN git clone https://github.com/swig/swig.git
RUN cd swig && ./autogen.sh && ./configure && make
RUN cd /swig && ./configure --prefix=/swig && make && make install
RUN ln -sv /usr/include/python3.7m/* /usr/include/
RUN echo "export SWIG_PATH=\"/swig\"" >> /etc/profile
RUN echo "export PATH=\$SWIG_PATH:\$PATH" >> /etc/profile