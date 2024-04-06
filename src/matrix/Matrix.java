import java.util.Arrays;
import java.util.Random;

public class Matrix {
    // Function to generate a random matrix
    public static double[][] generateRandomMatrix(int rows, int cols) {
        double[][] matrix = new double[rows][cols];
        Random random = new Random();
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                matrix[i][j] = random.nextDouble();
            }
        }
        return matrix;
    }

    // Function for matrix multiplication
    public static double[][] matrixMultiplication(double[][] a, double[][] b) {
        int rowsA = a.length;
        int colsA = a[0].length;
        int rowsB = b.length;
        int colsB = b[0].length;

        if (colsA != rowsB) {
            throw new IllegalArgumentException("Incompatible matrices for multiplication");
        }

        double[][] result = new double[rowsA][colsB];
        for (int i = 0; i < rowsA; i++) {
            Arrays.fill(result[i], 0.0);
        }

        for (int i = 0; i < rowsA; i++) {
            for (int j = 0; j < colsB; j++) {
                for (int k = 0; k < colsA; k++) {
                    result[i][j] += a[i][k] * b[k][j];
                }
            }
        }

        return result;
    }

    public static void main(String[] args) {
        long startTime = System.currentTimeMillis();

        int matrixSize = 1000; // Adjust the matrix size to increase memory usage
        System.out.println("matrixSize: " + matrixSize);

        double[][] matrixA = generateRandomMatrix(matrixSize, matrixSize);
        double[][] matrixB = generateRandomMatrix(matrixSize, matrixSize);
        double[][] resultMatrix = matrixMultiplication(matrixA, matrixB);

        long endTime = System.currentTimeMillis();
        System.out.println("Matrix Multiplication time: " + (endTime - startTime) + "ms");
    }
}