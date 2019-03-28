class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        let sSorted = Array(s).sorted()
        let tSorted = Array(t).sorted()
        
        for index in stride(from:0, to:s.count, by:1) {
            if sSorted[index] != tSorted[index] {
                return tSorted[index]
            }
        }
        return tSorted.last!
    }
}