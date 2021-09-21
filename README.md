## Kaleidoscope

### Building

Requires C++17, LLVM libraries, CMake 3.14.

```
kaleidoscope$> cmake -S src -B build
kaleidoscope$> cmake --build build
```

Or you can use the provided Dockerfile.

```
kaleidoscope$> docker build --tag kaleidoscope:latest .
kaleidoscope$> docker run -it -v ${PWD}:/src kaleidoscope:latest
$> cd src
src$> cmake -S src -B build
src$> cmake --build build
```