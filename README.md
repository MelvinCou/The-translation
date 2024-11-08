# The translation

Original repository : https://github.com/MelvinCou/The-translation

## Getting started

Tools needed:

- PlateformIO
- ClangFormat


```sh
# Check project (by default: cppcheck)
pio check --skip-packages
# Compile project
pio run
# List actions possible on a connected device
pio run --list-targets

# Format code
clang-format -i src/*.cpp include/*.hpp
```
