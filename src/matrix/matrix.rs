use std::time::Instant;

// Function to generate a random matrix
fn generate_random_matrix(rows: usize, cols: usize) -> Vec<Vec<f64>> {
    let mut matrix = Vec::with_capacity(rows);
    for _ in 0..rows {
        matrix.push((0..cols).map(|_| rand::random::<f64>()).collect());
    }
    matrix
}

// Function for matrix multiplication
fn matrix_multiplication(a: &Vec<Vec<f64>>, b: &Vec<Vec<f64>>) -> Vec<Vec<f64>> {
    let rows_a = a.len();
    let cols_a = a[0].len();
    let rows_b = b.len();
    let cols_b = b[0].len();

    if cols_a != rows_b {
        panic!("Incompatible matrices for multiplication");
    }

    let mut result = vec![vec![0.0; cols_b]; rows_a];

    for i in 0..rows_a {
        for j in 0..cols_b {
            for k in 0..cols_a {
                result[i][j] += a[i][k] * b[k][j];
            }
        }
    }

    result
}

fn main() {
    let start_time = Instant::now();

    let matrix_size = 1000; // Adjust the size of the matrix to increase memory usage
    println!("matrixSize: {}", matrix_size);

    let matrix_a = generate_random_matrix(matrix_size, matrix_size);
    let matrix_b = generate_random_matrix(matrix_size, matrix_size);
    matrix_multiplication(&matrix_a, &matrix_b);

    let elapsed_time = start_time.elapsed();
    println!("Matrix Multiplication time: {:?}", elapsed_time);
}