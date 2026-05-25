
# Minimal Makefile for static builds (x64 and arm64)
PROG        = usb_modeswitch
CC          ?= gcc
CFLAGS      += -Wall -Wno-deprecated-declarations
OBJS        = usb_modeswitch.c
LIBUSB_STATIC_FLAGS = $(shell pkg-config --cflags --libs --static libusb-1.0)
LIBUSB_A = $(shell brew --prefix libusb)/lib/libusb-1.0.a
LIBUSB_A_ARM = $(abspath ../build_with_static_linking/libusb/1.*/lib/libusb-1.0.a)
LIBUSB_A_X64 = $(abspath ../build_with_static_linking/libusb/1.*/lib/libusb-1.0.a)

.PHONY: all-static all-static-arm clean

all-static: $(PROG)-static

$(PROG)-static: $(OBJS) usb_modeswitch.h
	$(CC) -o $(PROG)-current $(OBJS) $(CFLAGS) $(LDFLAGS) $(filter-out -lusb-1.0,$(LIBUSB_STATIC_FLAGS)) $(LIBUSB_A)

all-static-arm: $(PROG)-static-arm

$(PROG)-static-arm: $(OBJS) usb_modeswitch.h
	$(CC) -arch arm64 -o $(PROG)-arm64 $(OBJS) $(CFLAGS) $(LDFLAGS) $(filter-out -lusb-1.0,$(LIBUSB_STATIC_FLAGS)) $(LIBUSB_A_ARM)

all-static-x64: $(PROG)-static-x64

$(PROG)-static-x64: $(OBJS) usb_modeswitch.h
	$(CC) -arch x86_64 -o $(PROG)-x64 $(OBJS) $(CFLAGS) $(LDFLAGS) $(filter-out -lusb-1.0,$(LIBUSB_STATIC_FLAGS)) $(LIBUSB_A_X64)

clean:
	rm -f $(PROG)-current $(PROG)-arm64 $(PROG)-x64
