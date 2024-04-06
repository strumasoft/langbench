const std = @import("std");
const print = std.debug.print;
const rand = @import("std").rand;
const time = @import("std").time;

const M: i64 = 800; // Adjust the matrix size to increase memory usage
const N: i64 = M;


// Function to generate a random matrix
fn generateRandomMatrix(matrix: *[M][N]i64, prng: *rand.DefaultPrng) void {
  for (matrix, 0..) |row, i| {
    for (row, 0..) |_, j| {
      matrix[i][j] = prng.random().intRangeAtMost(i64, 1, 100000);
    }
  }
}

// Function for matrix multiplication
fn matrixMultiplication(result: *[M][N]i64, a: *[M][N]i64, b: *[M][N]i64) void {
  for (result, 0..) |row, i| {
    for (row, 0..) |_, j| {
      result[i][j] = 0;
    }
  }
  
  for (result, 0..) |row, i| {
    for (row, 0..) |_, j| {
      for (0..N) |k| {
        result[i][j] = result[i][j] + a[i][k] * b[k][j];
      }
    }
  }
}

pub fn main() !void {
  const startTime = time.milliTimestamp();

  print("matrixSize: {}\n", .{M});

  var prng = std.rand.DefaultPrng.init(blk: {
    var seed: u64 = undefined;
    try std.os.getrandom(std.mem.asBytes(&seed));
    break :blk seed;
  });
  
  var a: [M][N]i64 = undefined;
  var b: [M][N]i64 = undefined;
  var result: [M][N]i64 = undefined;
  
  generateRandomMatrix(&a, &prng);
  generateRandomMatrix(&b, &prng);
  matrixMultiplication(&result, &a, &b);
  
  const endTime = time.milliTimestamp();
  const elapsedTime = endTime - startTime;
  
  print("Matrix Multiplication time: {}ms\n", .{elapsedTime});
}