all: java ada

java: NameTester.class

NameTester.class: NameTester.java
	javac -deprecation NameTester.java

ada: name_tester

name_tester: name_tester.adb
	gnatmake name_tester -gnata

clean:
	rm -f *.class *.o *.ali *~ name_tester
