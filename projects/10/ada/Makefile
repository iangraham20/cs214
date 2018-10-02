# Makefile for GNAT (Ada) compilation
#  for a 2-level class hierarchy

TARGET = birds
SUBPACKAGES = flying_package.ali walking_package.ali duck_package.ali goose_package.ali owl_package.ali penguin_package.ali ostrich_package.ali kiwi_package.ali
PACKAGES = bird_package.ali $(SUBPACKAGES)
CC     = gcc
CFLAGS = -c 

.SUFFIXES:
.SUFFIXES: .adb .ads                  # ada package body & spec.

$(TARGET): $(TARGET).ali $(PACKAGES)  # link target & packages
	$(BIN)gnatbind $(TARGET).ali
	$(BIN)gnatlink $(TARGET).ali

$(TARGET).ali: $(TARGET).adb          # compile target (w/o .ads)
	$(CC) $(CFLAGS) $<

%.ali : %.adb %.ads                   # compile packages (w .ads)
	$(CC) $(CFLAGS) $<

$(SUBPACKAGES) : bird_package.ads     # subclasses depend on superclass

clean:
	/bin/rm -f $(TARGET) *~ *.o *.ali *.c *#


