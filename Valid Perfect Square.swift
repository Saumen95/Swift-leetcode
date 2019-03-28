class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        guard num >= 0 && num <= 2147395600 else{
            return false
        }
        for i in 0...46340 {
            let i2 = i * i
            
            if i2 > num {
                return false
            }
            
            if num == i2 {
                return true
            }
        }
        return false;
    }
}