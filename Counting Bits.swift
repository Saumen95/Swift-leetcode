class Solution {
    func countBits(_ num: Int) -> [Int] {

        var array = [0]
        if num == 0{
            return 0
        }
        array.reverseCapacity(num + 1)
        for i in 1...num {
            array.append(1 + array[i & (i-1)])
        }
        return array

    }
}