# rv-toolchain-docker

A straightforward dockerfile to get the risc-v toolchain built for all possible abi/arch configurations. Includes a script to generate a `bin` directory that can be added to your path, with a wrapper script for each of the gcc commands that calls into docker with the current working directory mapped.
