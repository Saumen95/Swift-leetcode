class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        
        if denominator == 0 { return "NaN" }
        
        
        var numerator = numerator
        var denominator = denominator
        
    
        var negative = (numerator < 0) != (denominator < 0)
        
        numerator = abs(numerator)
        denominator = abs(denominator)
        
        var result = String(numerator / denominator)
        var remainder = (numerator % denominator) * 10
        
        if remainder == 0 {
            if negative == true && numerator != 0 {
                return String("-") + result
            } else {
                return result
            }
        }
        
        result += "."
        
   
        var repeatMap = [Int:Int]()
        
        while remainder != 0 {
            
        
            if let repeatIndex = repeatMap[remainder] {
                result.insert("(", at: result.index(result.startIndex, offsetBy: repeatIndex))
                result += ")"
                break
            }
            
            result += String(remainder / denominator)
            
            .
            repeatMap[remainder] = result.count - 1
            
            //Perform one more step of long division
            remainder = (remainder % denominator) * 10 
        }

        if negative == true {
            return String("-") + result
        }
        return result
    }
}