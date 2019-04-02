class Solution {
    let DIGIT_TO_LETTERS = [
    "",    // 0
    "",    // 1
    "abc", // 2
    "def", // 3
    "ghi", // 4
    "jkl", // 5
    "mno", // 6
    "pqrs",// 7
    "tuv", // 8
    "wxyz" // 9
]
    
func letterCombinations(_ digits: String) -> [String] {
    
    if digits == "" {
        return []
    }
    
    // apppend the every corresponding letters of the digit to the result array
    var possibleCombinations = [""]
    for digit in digits.characters {
        
        // make sure digits only contains [0-9]
        guard let num = Int(String(digit)) else {
            break
        }
        
        var newCombinations: [String] = []
        for combination in possibleCombinations {
            for letter in DIGIT_TO_LETTERS[num].characters {
                newCombinations.append(combination + String(letter))
            }
        }
        possibleCombinations = newCombinations
    }
    
    return possibleCombinations
}
}