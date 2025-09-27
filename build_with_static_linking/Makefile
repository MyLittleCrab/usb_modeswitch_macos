
# Minimal Makefile for static builds (x64 and arm64)
PROG        = usb_modeswitch
CC          ?= gcc
CFLAGS      += -Wall -Wno-deprecated-declarations
OBJS        = usb_modeswitch.c
LIBUSB_STATIC_FLAGS = $(shell pkg-config --cflags --libs --static libusb-1.0)
LIBUSB_A = /usr/local/Cellar/libusb/1.0.29/lib/libusb-1.0.a
LIBUSB_A_ARM = $(abspath ../build_with_static_linking/libusb/1.0.29/lib/libusb-1.0.a)

.PHONY: all-static all-static-arm clean

all-static: $(PROG)-static

$(PROG)-static: $(OBJS) usb_modeswitch.h
	$(CC) -o $(PROG)-x64 $(OBJS) $(CFLAGS) $(LDFLAGS) $(filter-out -lusb-1.0,$(LIBUSB_STATIC_FLAGS)) $(LIBUSB_A)

all-static-arm: $(PROG)-static-arm

$(PROG)-static-arm: $(OBJS) usb_modeswitch.h
	$(CC) -arch arm64 -o $(PROG)-arm64 $(OBJS) $(CFLAGS) $(LDFLAGS) $(filter-out -lusb-1.0,$(LIBUSB_STATIC_FLAGS)) $(LIBUSB_A_ARM)

clean:
	rm -f usb_modeswitch-x64 usb_modeswitch-arm64
