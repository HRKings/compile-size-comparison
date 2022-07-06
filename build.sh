#! /bin/bash

echo "Deleting old outputs..."
rm -rf out/

echo "Creating output folder..."
mkdir -p out/c
mkdir -p out/cpp
mkdir -p out/rust
mkdir -p out/go

echo "Compiling C..."
gcc c.c -o out/c/c_dynamic
gcc c.c --static -o out/c/c_static
gcc c.c -o out/c/c_dynamic_strip
gcc c.c --static -o out/c/c_static_strip

echo "Compiling C++..."
g++ cpp.cpp -o out/cpp/cpp_dynamic
g++ cpp.cpp --static -o out/cpp/cpp_static
g++ cpp.cpp -o out/cpp/cpp_dynamic_strip
g++ cpp.cpp --static -o out/cpp/cpp_static_strip

echo "Compiling Rust..."
rustc rust.rs -o out/rust/rust_static
rustc -C prefer_dynamic -C link-args="-Wl,-rpath,$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib" rust.rs -o out/rust/rust_dynamic
rustc rust.rs -o out/rust/rust_static_strip
rustc -C prefer_dynamic -C link-args="-Wl,-rpath,$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib" rust.rs -o out/rust/rust_dynamic_strip

echo "Compiling Go..."
go build -o out/go/go_static go.go
go build -o out/go/go_static_strip go.go

strip out/c/c_dynamic_strip
strip out/c/c_static_strip
strip out/cpp/cpp_dynamic_strip
strip out/cpp/cpp_static_strip
strip out/rust/rust_static_strip
strip out/rust/rust_dynamic_strip
strip out/go/go_static_strip

printf "=%.0s"  $(seq 1 "$(tput cols)")

printf "File sizes in bytes:\n"
find out/ -type f -exec ls -Al {} \+ | awk '{print $9 " -> " $5}' | cut -d '/' -f 3 | column -t

printf "\nFile sizes (human readable):\n"
find out/ -type f -exec ls -Alh {} \+ | awk '{print $9 " -> " $5}'  | cut -d '/' -f 3 | column -t
