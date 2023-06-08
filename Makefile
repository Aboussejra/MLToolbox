run:
	cmake -S standalone -B build/standalone
	cmake --build build/standalone
	./build/standalone/Greeter

all:
	mkdir -p build && make run && make test

clean:
	find -type f -name 'CMakeCache.txt' -delete

help:
	cmake -S standalone -B build/standalone
	cmake --build build/standalone
	./build/standalone/Greeter --help

test:
	cmake -S test -B build/test
	cmake --build build/test
	CTEST_OUTPUT_ON_FAILURE=1 cmake --build build/test --target test

check_fmt:
	cmake -S test -B build/test
	cmake --build build/test --target format

fmt:
	cmake -S test -B build/test
	cmake --build build/test --target fix-format

doc:
	cmake -S documentation -B build/doc
	cmake --build build/doc --target GenerateDocs
	# view the docs
	open build/doc/doxygen/html/index.html

.PHONY: run build help test check_fmt fmt doc all clean