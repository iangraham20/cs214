# Makefile for GNAT (Ada) compilation

TARGET = temperature_tester
PACKAGE = temperature_package

CC = gcc
CFLAGS = -c -gnata

# linking step
$(TARGET): $(TARGET).ali $(PACKAGE).o
	gnatbind $(TARGET).ali
	gnatlink $(TARGET).ali

# compile program
$(TARGET).ali: $(TARGET).adb $(PACKAGE).ads
	$(CC) $(CFLAGS) $(TARGET).adb

# compile package
$(PACKAGE).o: $(PACKAGE).adb $(PACKAGE).ads
	$(CC) $(CFLAGS) $(PACKAGE).adb

clean:
	rm -f $(TARGET) *~ *# *.o *.ali *.c
