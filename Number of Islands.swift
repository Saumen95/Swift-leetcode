class Solution {  
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else {
            return 0
        }

        let zero = Character("0")

        var visited = Set<String>()
        var count = 0

        func traverse(row: Int, col: Int, visited: inout Set<String>) {
            if row < 0 || row >= grid.count {
                return
            }

            if col < 0 || col >= grid.first!.count {
                return
            }

            let key = "\(row)-\(col)"
            if visited.contains(key) {
                return
            }

            visited.insert(key)
            if grid[row][col] == zero {
                return
            }

            traverse(row: row - 1, col: col, visited: &visited)
            traverse(row: row, col: col - 1, visited: &visited)
            traverse(row: row + 1, col: col, visited: &visited)
            traverse(row: row, col: col + 1, visited: &visited)
        }

        for (rowIndex, row) in grid.enumerated() {
            for (colIndex, col) in row.enumerated() {
                let key = "\(rowIndex)-\(colIndex)"
                if visited.contains(key) {
                    continue
                }

                if col == zero {
                    visited.insert(key)
                    continue
                }

                count += 1
                traverse(row: rowIndex, col: colIndex, visited: &visited)
            }
        }

        return count
    }
}