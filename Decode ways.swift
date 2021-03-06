class Solution {
    func numDecodings(_ s: String) -> Int {
        let n = s.count
        guard n != 0 else { return 0 }
        var memo = Array<Int>(repeating: 0, count: n+1)
        memo[n] = 1
        memo[n-1] = s[s.index(before: s.endIndex)] != "0" ? 1 : 0
        if n-2 >= 0 {
            for i in Array(0...n-2).reversed() {
                let idx = s.index(s.startIndex, offsetBy: i)
                if s[idx] == "0" { continue }
                else {
                    memo[i] = (Int(s[idx...s.index(after: idx)])! <= 26) ? memo[i+1] + memo[i+2] : memo[i+1]
                }
            }
        }
        return memo[0]
    }
}