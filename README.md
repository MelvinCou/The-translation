# The translation

Original repository : https://github.com/MelvinCou/The-translation

## Getting started

Tools needed:

- PlateformIO


```sh
# Check project (by default: cppcheck)
pio check --skip-packages
# Compile project
pio run
# List actions possible on a connected device
pio run --list-targets
# Compile for CI
pio ci --lib=".pio/libdeps/m5stack-core2/M5Stack/src" --board=m5stack-core2 .
```
