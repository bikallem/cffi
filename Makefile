all: clean fmt info build

build:
	moon build	

fmt: 
	moon fmt
	clang-format -i ./**/*.c	

clean:
	moon clean

check:
	moon check

info:
	moon info

asan: clean
	MOON_CC="clang -g -O1 -fsanitize=address -fno-omit-frame-pointer" moon build
	ASAN_OPTIONS="detect_leaks=1:log_path=asan.log:atexit=1" ./target/native/release/build/example/main/main.exe

.PHONY: all build fmt clean check info asan