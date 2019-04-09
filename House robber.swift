class Solution {
    func rob(_ nums: [Int]) -> Int {
        var curt = 0, prev = 0
        for num in nums{
        	(curt, prev) = (max(curt, prev + num), curt)
        }
        return curt
    }
}