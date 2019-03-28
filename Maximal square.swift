class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0 else { return 0 }
        var h = matrix[0].map { _ in 0 }
        var result = 0
        for i in 0..<matrix.count {
            for j in 0..<h.count {
                if matrix[i][j] == "0" {
                    h[j] = 0
                } else {
                    h[j] += 1
                }
            }
            
            var stack = [Int]()
            for i in 0...h.count {
                while let last = stack.last, i == h.count || h[last] > h[i] {
                    stack.removeLast()
                    if let lastlast = stack.last {
                        let edge = min(i - (lastlast + 1), h[last])
                        result = max(result, edge * edge)
                    } else {
                        let edge = min(i, h[last])
                        result = max(result, edge * edge)
                    }
                }
                if i < h.count {
                    stack.append(i)
                }
            }
        }
        return result
    }
}