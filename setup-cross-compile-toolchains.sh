#!/bin/bash

# https://timryan.org/2018/07/27/cross-compiling-linux-binaries-from-macos.html

rustup target add x86_64-unknown-linux-musl
rustup target add x86_64-apple-darwin
