#!/usr/bin/env bash
set -e

WORK="${HOME}"
KERNEL_DIR="${WORK}/myKernel"
OUT_DIR="${KERNEL_DIR}/out"
DEFCONFIG="ice_defconfig"

export ARCH=arm

export PATH="${WORK}/clang/bin:${WORK}/x32/bin:${WORK}/x64/bin:${PATH}"

cd "${KERNEL_DIR}"

echo "== Cleaning old output =="
rm -rf "${OUT_DIR}"

echo "== Generating defconfig =="

make O=out \
    ARCH=arm \
    "${DEFCONFIG}"

echo "== Building kernel =="

make -j"$(nproc)" \
    O=out \
    ARCH=arm \
    CC=clang \
    HOSTCC=gcc \
    HOSTCXX=g++ \
    LD=arm-linux-androideabi-ld.bfd \
    CLANG_TRIPLE=arm-linux-gnueabi- \
    CROSS_COMPILE=arm-linux-androideabi-

echo
echo "Build completed."
echo "Kernel:"
ls -lh out/arch/arm/boot/zImage
