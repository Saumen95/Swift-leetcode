class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let set = Set(nums)
        
        var longestStreak = 0
        
        for s in set {
            if !set.contains(s - 1) {
                var currentNumber = s
                var currentStreak = 1
                
                while set.contains(currentNumber + 1) {
                    currentNumber += 1
                    currentStreak += 1
                }
                
                longestStreak = max(longestStreak, currentStreak)
            }
        }
        
        return longestStreak
    }
}