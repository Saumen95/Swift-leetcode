class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var candidate = [Int]()
        
        backtracking(&result, &candidate, candidates.sorted(), target, 0)
        
        return result
    }
    
    private func backtracking(_ result: inout [[Int]], _ candidate: inout [Int], _ candidates: [Int], _ remain: Int, _ start: Int) {
        if remain < 0 {
            return
        } else if remain == 0 {
            result.append(candidate)
        } else {
            for i in start..<candidates.count {
                candidate.append(candidates[i])
                backtracking(&result, &candidate, candidates, remain - candidates[i], i)
                candidate.removeLast()
            }
        }
    }
}