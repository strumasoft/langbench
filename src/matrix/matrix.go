package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Function to generate a random matrix
func generateRandomMatrix(rows, cols int) [][]float64 {
    matrix := make([][]float64, rows)
    for i := 0; i < rows; i++ {
        matrix[i] = make([]float64, cols)
        for j := 0; j < cols; j++ {
            matrix[i][j] = rand.Float64()
        }
    }
    return matrix
}

// Function for matrix multiplication
func matrixMultiplication(a, b [][]float64) [][]float64 {
    rowsA := len(a)
    colsA := len(a[0])
    rowsB := len(b)
    colsB := len(b[0])

    if colsA != rowsB {
        panic("Incompatible matrices for multiplication")
    }

    result := make([][]float64, rowsA)
    for i := 0; i < rowsA; i++ {
        result[i] = make([]float64, colsB)
    }

    for i := 0; i < rowsA; i++ {
        for j := 0; j < colsB; j++ {
            for k := 0; k < colsA; k++ {
                result[i][j] += a[i][k] * b[k][j]
            }
        }
    }

    return result
}

func main() {
    start := time.Now()
    
    rand.Seed(time.Now().UnixNano())

    matrixSize := 1000 // Adjust the size of the matrix to increase memory usage
    fmt.Println("matrixSize:", matrixSize)

    matrixA := generateRandomMatrix(matrixSize, matrixSize)
    matrixB := generateRandomMatrix(matrixSize, matrixSize)
    matrixMultiplication(matrixA, matrixB)
    
    duration := time.Since(start)
    fmt.Println("Matrix Multiplication time:", duration)
}