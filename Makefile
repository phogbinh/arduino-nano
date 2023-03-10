CC=D:\ies-1102\avr-gcc\bin\avr-gcc.exe
CPP=D:\ies-1102\avr-gcc\bin\avr-g++.exe
AR=D:\ies-1102\avr-gcc\bin\avr-ar.exe

OBJECTS=WInterrupts.o wiring_analog.o wiring.o wiring_digital.o wiring_pulse.o wiring_shift.o CDC.o HardwareSerial.o HID.o IPAddress.o main.o new.o Print.o Stream.o Tone.o USBCore.o WMath.o WString.o
HEADERS=Arduino.h binary.h Client.h HardwareSerial.h IPAddress.h new.h pins_arduino.h Printable.h Print.h Server.h Stream.h Udp.h USBAPI.h USBCore.h USBDesc.h WCharacter.h wiring_private.h WString.h

CFLAGS=-I . -std=gnu99 -DF_CPU=16000000UL -Os -mmcu=atmega328p
CPPFLAGS=-I . -DF_CPU=16000000UL -Os -mmcu=atmega328p

all: ${OBJECTS}
	${AR} crs libarduino.a ${OBJECTS}

.c.o: ${HEADERS}
	${CC} ${CFLAGS} -c $*.c

.cpp.o: ${HEADERS}
	${CPP} ${CPPFLAGS} -c $*.cpp

clean:
	del ${OBJECTS} core a.out errs
