# Language Benchmark


## Node.js vs Deno vs Bun vs LuaJIT vs Java vs Rust vs C vs Zig vs Go


### Node.js
https://nodejs.org/en/download

### Deno
https://docs.deno.com/runtime/manual/getting_started/installation
```sh
curl -fsSL https://deno.land/install.sh | sh
```

### Bun
https://bun.sh/docs/installation
```sh
curl -fsSL https://bun.sh/install | bash
```

### LuaJIT
https://luajit.org/install.html


### Java
https://www.oracle.com/java/technologies/downloads/

### Rust
https://www.rust-lang.org/tools/install
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### C
```sh
sudo apt install build-essential
```

### Zig
https://ziglang.org/download/
```sh
mkdir ~/opt/zig
curl -L https://ziglang.org/builds/zig-linux-x86_64-0.12.0-dev.3212+40e64245f.tar.xz | tar -xJ -C ~/opt/zig --strip-components=1
```

### Go
https://go.dev/doc/install
```sh
mkdir ~/opt/go
curl -sSL https://go.dev/dl/go1.22.1.linux-amd64.tar.gz | tar -C ~/opt/go -xz
```


# Results
```
=== Node.js ===
matrixSize: 1000
Matrix Multiplication: 14.619s
=== Deno ===
matrixSize: 1000
Matrix Multiplication: 15196ms
=== Bun ===
matrixSize: 1000
[17.94s] Matrix Multiplication
=== LuaJIT ===
matrixSize: 1000
Matrix Multiplication time: 10.702061s
=== Java ===
matrixSize: 1000
Matrix Multiplication time: 8225ms
=== Rust ===
matrixSize: 1000
Matrix Multiplication time: 8.35774413s
=== C ===
matrixSize: 1000
Matrix Multiplication time: 13.690093s
=== Zig ===
matrixSize: 800
Matrix Multiplication time: 11882ms
=== Go ===
matrixSize: 1000
Matrix Multiplication time: 15.229626895s
```
