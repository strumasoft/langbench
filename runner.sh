#!/bin/bash

rm -R target
mkdir target

echo "=== Node.js ==="
node src/matrix/matrix.js

echo "=== Deno ==="
deno run src/matrix/matrix.js

echo "=== Bun ==="
bun src/matrix/matrix.js

echo "=== LuaJIT ==="
luajit src/matrix/matrix.lua

echo "=== Java ==="
javac -d target src/matrix/Matrix.java
cd target
java Matrix
cd ../

echo "=== Rust ==="
cargo build --release --quiet && ./target/release/matrix

echo "=== C ==="
gcc -o target/matrix src/matrix/matrix.c && ./target/matrix

echo "=== Zig ==="
zig build-exe src/matrix/matrix.zig && ./matrix

echo "=== Go ==="
go run src/matrix/matrix.go
