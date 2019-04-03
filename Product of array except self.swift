class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
    let sum = nums.reduce(1, *)
    var result = [Int]()
    if sum == 0 {
        var temp = nums
        var rem: Int
        for idx in 0..<nums.count {
            if temp.contains(0)  && (temp.filter{$0 == 0}.count > 1)
            {
                result.append(0)
                continue
            }
            rem = temp.remove(at: idx)
            result.append(temp.reduce(1, *))
            temp.insert(rem, at: idx)
        }

    }
    else{
        for idx in 0..<nums.count {
            result.append(sum/nums[idx])
        }
    }
    return result
}
}