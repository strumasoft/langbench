#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Function to generate a random matrix
void generateRandomMatrix(int rows, int cols, double **matrix) {
    for (int i = 0; i < rows; i++) {
        matrix[i] = (double *)malloc(cols * sizeof(double));
        for (int j = 0; j < cols; j++) {
            matrix[i][j] = ((double)rand() / RAND_MAX);
        }
    }
}

// Function for matrix multiplication
void matrixMultiplication(int rowsA, int colsA, double **a, int rowsB, int colsB, double **b, double **result) {
    if (colsA != rowsB) {
        fprintf(stderr, "Incompatible matrices for multiplication\n");
        exit(1);
    }

    for (int i = 0; i < rowsA; i++) {
        result[i] = (double *)malloc(colsB * sizeof(double));
        for (int j = 0; j < colsB; j++) {
            result[i][j] = 0;
            for (int k = 0; k < colsA; k++) {
                result[i][j] += a[i][k] * b[k][j];
            }
        }
    }
}

int main() {
    clock_t start = clock();

    int matrixSize = 1000; // Adjust the size of the matrix to increase memory usage
    printf("matrixSize: %d\n", matrixSize);

    // Generate random matrices and multiply
    double **matrixA = (double **)malloc(matrixSize * sizeof(double *));
    double **matrixB = (double **)malloc(matrixSize * sizeof(double *));
    double **resultMatrix = (double **)malloc(matrixSize * sizeof(double *));
    generateRandomMatrix(matrixSize, matrixSize, matrixA);
    generateRandomMatrix(matrixSize, matrixSize, matrixB);
    matrixMultiplication(matrixSize, matrixSize, matrixA, matrixSize, matrixSize, matrixB, resultMatrix);

    // Free allocated memory
    for (int i = 0; i < matrixSize; i++) {
        free(matrixA[i]);
        free(matrixB[i]);
        free(resultMatrix[i]);
    }
    free(matrixA);
    free(matrixB);
    free(resultMatrix);

    clock_t end = clock();
    double cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("Matrix Multiplication time: %fs\n", cpu_time_used);

    return 0;
}