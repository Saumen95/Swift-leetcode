class Solution {
   func isUgly(_ num: Int) -> Bool {
    if num == 0 { return false }
    var num = num
    for i in 2...5 where i != 4 {
        while num % i == 0 {
            num /= i
        }
    }
    return num == 1
}
}