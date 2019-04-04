class Solution{
    func containsNearbyDuplicate(nums: [Int], _ k: Int) -> Bool {
        // edge case
        if nums.count <= 1 {
            return false
        }
        
        // key: nums[index], value: index
        var dict = [Int: Int]()
        
        for i in 0 ..< nums.count {
            guard let index = dict[nums[i]] where i - index <= k else {
                dict[nums[i]] = i
                continue
            } 
            
            return true
        }
        
        return false
    }
}