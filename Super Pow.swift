class Solution {
    func superPow(_ a: Int, _ b: [Int]) -> Int {
        var res = 1
        for i in 0 ..< b.count {
            res = pow(res, 10) * pow(a, b[i]) % 1337
        }
        return res
    }
  
    func pow(_ x: Int, _ n : Int) -> Int {
        if n == 0 {
            return 1
        }
        if n == 1 {
            return x % 1337
        }
        return pow(x % 1337, n / 2) * pow(x % 1337, n - n / 2) % 1337
    }
}