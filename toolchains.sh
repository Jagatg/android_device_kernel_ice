#!/usr/bin/env bash
set -e

WORK="${HOME}"

CLANG_REPO="https://github.com/techyminati/android_prebuilts_clang_host_linux-x86_clang-6443078"
GCC32_REPO="https://github.com/KudProject/arm-linux-androideabi-4.9"
GCC64_REPO="https://github.com/KudProject/aarch64-linux-android-4.9"

mkdir -p "${WORK}"

if [ ! -d "${WORK}/clang" ]; then
    git clone --depth=1 "${CLANG_REPO}" "${WORK}/clang"
fi

if [ ! -d "${WORK}/x32" ]; then
    git clone --depth=1 "${GCC32_REPO}" "${WORK}/x32"
fi

if [ ! -d "${WORK}/x64" ]; then
    git clone --depth=1 "${GCC64_REPO}" "${WORK}/x64"
fi

echo "Toolchains downloaded successfully."
