# Makefile for GNAT (Ada) log_table

TARGET = log_table
CC     = gcc
CFLAGS = -c

$(TARGET): $(TARGET).ali
	gnatbind -x $(TARGET).ali
	gnatlink $(TARGET).ali

$(TARGET).ali: $(TARGET).adb
	$(CC) $(CFLAGS) $(TARGET).adb

clean:
	rm -f $(TARGET) *~ *# *.o *.ali


