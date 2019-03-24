class Solution {
    func rob(_ nums: [Int]) -> Int {
        switch nums.count {
        case ...3:
            return nums.max() ?? 0
        default:
            let case1 = robNoCircle(nums, 1, nums.count-3) + nums[nums.count-1]
            let case2 = robNoCircle(nums, 0, nums.count-2)
            return max(case1, case2)
        }
    }
    
    func robNoCircle(_ nums: [Int], _ i: Int, _ j: Int) -> Int {
        guard i <= j else { return 0 }
        var prev = 0, curr = 0
        for p in i...j {
            let next = max(prev + nums[p], curr)
            prev = curr
            curr = next
        }
        return curr
    }
}