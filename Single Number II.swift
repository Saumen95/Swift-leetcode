class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var ans = 0
        var sum = 0
        
        for i in 0..<64 {
            sum = 0
            let tmp = (1 << i)
            for j in 0..<nums.count {
                if tmp & nums[j] != 0 {
                    sum = sum + 1
                }
            }
            
            if sum % 3 == 1 {
                ans = ans ^ tmp
            }
        }
        
        return ans
    }
}