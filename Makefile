CC=gcc
CXX=g++
RM=rm -f
CPPFLAGS=-g -std=c++17 -O2
LDFLAGS=-g
LDLIBS=-lX11 -lGL -lpthread -lpng -lstdc++fs

SRCS=mandelbrot.cpp
OBJS=$(subst .cpp,.o,$(SRCS))

all: mandelbrot

run: mandelbrot
	@./mandelbrot

mandelbrot: $(OBJS)
	$(CXX) $(LDFLAGS) -o mandelbrot $(OBJS) $(LDLIBS)

depend: .depend

.depend: $(SRCS)
	$(RM) ./.depend
	$(CXX) $(CPPFLAGS) -MM $^>>./.depend;

clean:
	$(RM) $(OBJS) mandelbrot *~ .depend

include .depend