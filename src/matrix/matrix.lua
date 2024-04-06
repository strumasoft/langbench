-- Function to generate a random matrix
function generateRandomMatrix(rows, cols)
    local matrix = {}
    for i = 1, rows do
        matrix[i] = {}
        for j = 1, cols do
            matrix[i][j] = math.random()
        end
    end
    return matrix
end

-- Function for matrix multiplication
function matrixMultiplication(a, b)
    local rowsA, colsA = #a, #a[1]
    local rowsB, colsB = #b, #b[1]

    if colsA ~= rowsB then
        error("Incompatible matrices for multiplication")
    end

    local result = {}
    for i = 1, rowsA do
        result[i] = {}
        for j = 1, colsB do
            result[i][j] = 0
        end
    end

    for i = 1, rowsA do
        for j = 1, colsB do
            for k = 1, colsA do
                result[i][j] = result[i][j] + a[i][k] * b[k][j]
            end
        end
    end

    return result
end


local startTime = os.clock()

local matrixSize = 1000 -- Adjust the matrix size to increase memory usage
print("matrixSize: " .. matrixSize)

local matrixA = generateRandomMatrix(matrixSize, matrixSize)
local matrixB = generateRandomMatrix(matrixSize, matrixSize)
matrixMultiplication(matrixA, matrixB)

local endTime = os.clock()
print("Matrix Multiplication time: " .. endTime - startTime .. "s")