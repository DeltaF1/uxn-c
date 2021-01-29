#!/bin/bash

# format code
clang-format -i uxnasm.c
clang-format -i uxn.c

# remove old
rm -f ./uxnasm
rm -f ./uxn

# debug(slow)
cc -std=c89 -DDEBUG -Wall -Wno-unknown-pragmas -Wpedantic -Wshadow -Wextra -Werror=implicit-int -Werror=incompatible-pointer-types -Werror=int-conversion -Wvla -g -Og -fsanitize=address -fsanitize=undefined uxnasm.c -o uxnasm
cc -std=c89 -DDEBUG -Wall -Wno-unknown-pragmas -Wpedantic -Wshadow -Wextra -Werror=implicit-int -Werror=incompatible-pointer-types -Werror=int-conversion -Wvla -g -Og -fsanitize=address -fsanitize=undefined uxn.c -o uxn

# build(fast)
# cc uxn.c -std=c89 -Os -DNDEBUG -g0 -s -Wall -Wno-unknown-pragmas -o uxn

# Size
echo "Size: $(du -sk ./uxn)"

# run
./uxnasm program.usm program.rom
./uxn program.rom
