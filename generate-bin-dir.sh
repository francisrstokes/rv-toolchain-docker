#!/bin/bash

RV_GNU_PREFIX="riscv64-unknown-linux-gnu-"
RV_GNU_TOOLS=( addr2line ar as c++ c++filt cpp elfedit g++ gcc gcc-12.2.0 gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gdb gdb-add-index gfortran gprof ld ld.bfd lto-dump nm objcopy objdump ranlib readelf run size strings strip )
DOCKER_IMAGE_NAME="francisstokes/rv-toolchain:latest"

mkdir -p ./bin

for tool in "${RV_GNU_TOOLS[@]}"; do
  tool=$RV_GNU_PREFIX$tool
  touch ./bin/$tool
  echo "#!/bin/sh"                                                                    >> ./bin/$tool
  echo "docker run -v \$(pwd):/project -w /project -it $DOCKER_IMAGE_NAME $tool \$@"  >> ./bin/$tool
  chmod +x ./bin/$tool
done
