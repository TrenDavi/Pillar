#!/usr/bin/env python3

import subprocess

COMPILE_COMMAND = [     \
    "ls",               \
]

HEX_COMMAND = [         \
    "./elf2hex",        \
    "--bit-width",      \
    "8",                \
    "--input",          \
    "suite.o",          \
    "--output",         \
    "tmp.hex",          \
]

TEST_COMMAND = [        \
    "ls",               \
]

def main(): 
    # Compile
    subprocess.run(COMPILE_COMMAND)

    # Hex
    subprocess.run(HEX_COMMAND)

    #Test
    subprocess.run(TEST_COMMAND)


if __name__ == "__main__":
    main()
