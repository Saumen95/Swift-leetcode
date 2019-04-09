class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 0 { return false }
        var curr = nums[0]
        for i in 1 ..< nums.count {
            if curr == 0 { return false }
            curr = max(curr - 1, nums[i])
        }
        return true
    }
}