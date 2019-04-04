class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
    var dict = [Int: Int]()
    var res = [Int]()
    var sum = Array(1...nums.count).reduce(0, {$0 + $1})
    
    for num in nums {
        dict[num] = dict[num] != nil ? dict[num]! + 1 : 1
        if dict[num]! > 1{
            res.append(num)
        } else {
            sum -= num
        }
    }
    res.append(sum)
    return res
}
}