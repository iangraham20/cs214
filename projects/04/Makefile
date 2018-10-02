# Makefile for GNAT (Ada) factorials

TARGET = factorials
CC     = gcc
CFLAGS = -c

$(TARGET): $(TARGET).ali
	gnatbind -x $(TARGET).ali
	gnatlink $(TARGET).ali

$(TARGET).ali: $(TARGET).adb
	$(CC) $(CFLAGS) $(TARGET).adb

clean:
	rm -f $(TARGET) *~ *# *.o *.ali


