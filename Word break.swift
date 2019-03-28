class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        
        if s.isEmpty {
            return true
        }
        
        if wordDict.count == 0 {
            return false
        }
        
        var wordArray = Array.init(repeating: false, count: s.count + 1)
        wordArray[0] = true
        
        for i in 1...s.count {
            for j in stride(from: i-1, through: 0, by: -1) {

                if wordArray[j] && wordDict.contains(String(s[s.index(s.startIndex, offsetBy: j)..<s.index(s.startIndex, offsetBy: i)])) {
                    wordArray[i] = true
                    break
                }
            }
        }
        
        return wordArray[s.count]
    }
}