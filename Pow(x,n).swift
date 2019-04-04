class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0{return 1;}
        if(n<0){x = 1/x;
        n = -n;}
        return(n % 2 == 0)? myPow(x: x*x, n = n/2);
    }
}