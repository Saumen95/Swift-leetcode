class Solution {
    func baseNeg2(_ N: Int) -> String {
        var N = N, result = ""
        while N != 0 {
            result = String(abs(N % -2)) + result
            N = Int(ceil(Double(N) / -2))
        }
        return result.isEmpty ? "0" : result
    }
}