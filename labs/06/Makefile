# Makefile for Java and Ada versions of split.

all: java ada

java: Average.class
ada: average

Average.class: Average.java
	javac -deprecation Average.java


average: average.adb
	gnatmake average.adb

clean:
	rm -f $(TARGET) *~ *# *.o *.ali *.class


